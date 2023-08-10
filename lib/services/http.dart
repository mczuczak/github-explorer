import 'package:github_explorer/config/constants.dart';
import 'package:github_explorer/controllers/app.dart';
import 'package:github_explorer/services/auth.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:jwt_decode/jwt_decode.dart';

class HttpService {
  late Dio _dio;

  Future<Dio> getDio(BuildContext context,
      {contentType = 'application/x-www-form-urlencoded',
      responseType = ResponseType.plain}) async {
    return Dio(
      BaseOptions(
        headers: {
          'Accept': 'application/json',
          'Authorization': 'token ${ConfigConstants.token}',
          'DeviceId': await GetIt.I<AuthService>().getDeviceId(),
        },
        followRedirects: false,
        contentType: contentType,
        responseType: responseType,
        validateStatus: (status) {
          return status! < 500;
        },
      ),
    );
  }

  Future handleRequest({
    required String uri,
    required String method,
    required queryParameters,
    required data,
    String? category = '',
    required Function(Response) callback,
    required Function(DioError) onError,
    required Function(DioError) onCors,
    required BuildContext context,
    ResponseType responseType = ResponseType.plain,
    String contentType = 'application/x-www-form-urlencoded',
    bool disableLogs = false,
  }) async {
    _dio = await getDio(context,
        responseType: responseType, contentType: contentType);
    var request = prepareRequest(uri, method, data, queryParameters);
    try {
      if (!disableLogs) {
        GetIt.I<AppController>().printDebug(
          'Starting request $method: [$uri]',
          category: category,
        );
      }
      var token = await GetIt.I<AuthService>().getToken();
      if (token != null) {
        if (Jwt.getExpiryDate(token)!
            .toLocal()
            .isBefore(DateTime.now().toLocal())) {
          await GetIt.I<AuthService>().refreshToken(context);
        }
      }
      await processRequest(await request, uri, method, data, queryParameters,
          category, context, callback, onError, disableLogs);
    } on DioError catch (e) {
      if (e.response!.statusCode == 500 || e.response!.statusCode == 503) {
        //Implement backend down screen
      }
      GetIt.I<AppController>().printDebug(
        'Server error [${e.requestOptions.uri}] [${e.response!.statusCode}]',
        category: category,
      );
    }
  }

  dynamic prepareRequest(uri, method, data, queryParameters) {
    dynamic request;

    switch (method) {
      case 'POST':
        {
          request =
              _dio.post(uri, queryParameters: queryParameters, data: data);
        }
        break;
      case 'GET':
        {
          request = _dio.get(uri, queryParameters: queryParameters);
        }
        break;
      case 'DELETE':
        {
          request =
              _dio.delete(uri, queryParameters: queryParameters, data: data);
        }
        break;
      default:
        {
          request = _dio.get(uri, queryParameters: queryParameters);
        }
        break;
    }
    return request;
  }

  Future processRequest(Response response, uri, method, data, queryParameters,
      category, BuildContext context, callback, onError, disableLogs) async {
    if (!disableLogs) {
      GetIt.I<AppController>().printDebug(
        'Processed request ${response.requestOptions.method}: [${response.requestOptions.uri}]',
        category: category,
      );
    }

    if (response.statusCode == 401) {
      if (response.statusCode == 401 &&
          checkHowManyRequests(response.requestOptions.uri.toString()) < 4) {
        await retryRequest(response, uri, method, data, queryParameters,
            category, context, callback, onError, disableLogs);
      } else {
        //If 401 and it was retried before logout
        if (response.statusCode == 401) {
          GetIt.I<AppController>().requestRetries.removeWhere(
              (element) => element == response.requestOptions.uri.toString());
          await GetIt.I<AuthService>().forceLogout();
        } else {
          if (response.toString().contains('responseException')) {
            if (response.statusCode != 404) {
              onError(response);
            }
          } else {
            onError(response);
          }
        }
      }
    } else {
      if (GetIt.I<AppController>()
          .requestRetries
          .contains(response.requestOptions.uri.toString())) {
        GetIt.I<AppController>()
            .requestRetries
            .remove(response.requestOptions.uri.toString());
      }
      callback(response);
    }
  }

  Future retryRequest(response, uri, method, data, queryParameters, category,
      context, callback, onError, disableLogs) async {
    GetIt.I<AppController>().printDebug(
      'Got 401 Refreshing token and retrying previous request [${response.requestOptions.uri}]',
      category: category,
    );
    GetIt.I<AppController>()
        .requestRetries
        .add(response.requestOptions.uri.toString());
    await GetIt.I<AuthService>().refreshToken(context);
    _dio.options.headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${await GetIt.I<AuthService>().getToken()}',
    };
    var request = prepareRequest(uri, method, data, queryParameters);
    await processRequest(await request, uri, method, data, queryParameters,
        category, context, callback, onError, disableLogs);
  }

  int checkHowManyRequests(String uri) {
    var count = 0;

    for (var u in GetIt.I<AppController>().requestRetries) {
      if (u == uri) {
        count++;
      }
    }

    return count;
  }
}
