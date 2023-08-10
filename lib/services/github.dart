import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:github_explorer/config/constants.dart';
import 'package:github_explorer/controllers/app.dart';
import 'package:github_explorer/models/issue.dart';
import 'package:github_explorer/models/pagination.dart';
import 'package:github_explorer/models/pull.dart';
import 'package:github_explorer/models/repo.dart';
import 'package:github_explorer/services/http.dart';

class GithubService {
  Future<Pagination?> getRepos({required String query, int page = 1}) async {
    Pagination? resp;

    await GetIt.I<HttpService>().handleRequest(
      uri: '${ConfigConstants.apiUrl}/search/repositories',
      method: 'GET',
      queryParameters: {
        'q': query,
        'page': page,
      },
      data: null,
      callback: (Response response) async {
        Pagination pagination =
            Pagination.fromJson(json.decode(await response.data));
        List<Repo> items;
        items = pagination.items.map((i) => Repo.fromJson(i)).toList();
        pagination.items = items;
        resp = pagination;
      },
      onError: (e) {},
      onCors: (e) {},
      context: GetIt.I<AppController>().navigatorKey.currentContext!,
    );

    return resp;
  }

  Future<List<Issue>?> getIssues({required String repo, int page = 1}) async {
    List<Issue>? resp;

    await GetIt.I<HttpService>().handleRequest(
      uri: '${ConfigConstants.apiUrl}/repos/$repo/issues',
      method: 'GET',
      queryParameters: {
        'page': page,
      },
      data: null,
      callback: (Response response) async {
        List<Issue> items;
        items = (json.decode(response.data) as List)
            .map((i) => Issue.fromJson(i))
            .toList();
        resp = items;
      },
      onError: (e) {},
      onCors: (e) {},
      context: GetIt.I<AppController>().navigatorKey.currentContext!,
    );

    return resp;
  }

  Future<List<Pull>?> getPulls({required String repo, int page = 1}) async {
    List<Pull>? resp;

    await GetIt.I<HttpService>().handleRequest(
      uri: '${ConfigConstants.apiUrl}/repos/$repo/pulls',
      method: 'GET',
      queryParameters: {
        'page': page,
      },
      data: null,
      callback: (Response response) async {
        List<Pull> items;
        items = (json.decode(response.data) as List)
            .map((i) => Pull.fromJson(i))
            .toList();
        resp = items;
      },
      onError: (e) {},
      onCors: (e) {},
      context: GetIt.I<AppController>().navigatorKey.currentContext!,
    );

    return resp;
  }
}
