import 'dart:async';
import 'dart:io';
import 'package:android_id/android_id.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthService {
  //SETTERS
  void setToken(String token, String refreshToken) async {
    var storage = const FlutterSecureStorage();

    await storage.write(key: 'token', value: token);
    await storage.write(key: 'refreshToken', value: refreshToken);
  }

  Future<bool?> setEnv(String env) async {
    var storage = const FlutterSecureStorage();
    await storage.write(key: 'env', value: env);
    return true;
  }

  //GETTERS
  Future<String?> getDeviceId() async {
    var deviceInfo = DeviceInfoPlugin();

    if (Platform.isIOS) {
      var iosDeviceInfo = await deviceInfo.iosInfo;
      return iosDeviceInfo.identifierForVendor; // unique ID on iOS
    } else if (Platform.isAndroid) {
      const _androidIdPlugin = AndroidId();
      return await _androidIdPlugin.getId(); // unique ID on Android
    }
    return null;
  }

  Future<String?> getToken() async {
    var storage = const FlutterSecureStorage();
    return storage.read(key: 'token');
  }

  Future<String?> getEnv() async {
    var storage = const FlutterSecureStorage();
    return storage.read(key: 'env');
  }

  Future<String?> getRefreshToken() async {
    var storage = const FlutterSecureStorage();
    return storage.read(key: 'refreshToken');
  }

  //METHODS
  Future forceLogout({String? error}) async {}

  Future refreshToken(context) async {}

  Future removeToken() async {
    var storage = const FlutterSecureStorage();
    return storage.delete(key: 'token');
  }

  Future removeRefreshToken() async {
    var storage = const FlutterSecureStorage();
    return storage.delete(key: 'refreshToken');
  }
}
