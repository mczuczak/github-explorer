import 'dart:io';

import 'package:github_explorer/controllers/app.dart';
import 'package:github_explorer/extensions/string.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_device_type/flutter_device_type.dart';
import 'package:get_it/get_it.dart';

class PlatformHelper {
  WebBrowserInfo? webBrowserInfo = GetIt.I<AppController>().webBrowserInfo;
  IosDeviceInfo? iosInfo = GetIt.I<AppController>().iosInfo;
  MacOsDeviceInfo? macOsInfo = GetIt.I<AppController>().macOsInfo;
  AndroidDeviceInfo? androidInfo = GetIt.I<AppController>().androidInfo;

  String? getDeviceName() {
    String? deviceName = '';
    if (kIsWeb) {
      if (webBrowserInfo!.userAgent!.contains('Mac')) {
        deviceName = 'Mac';
      } else if (webBrowserInfo!.userAgent!.contains('Windows')) {
        deviceName = 'Windows';
      }
    } else {
      if (Platform.isIOS) {
        deviceName = iosInfo!.name.toString();
      }

      if (Platform.isMacOS) {
        deviceName = macOsInfo!.computerName.toString();
      }

      if (Platform.isAndroid) {
        deviceName = androidInfo!.model;
      }
    }
    return deviceName;
  }

  String getPlatformName() {
    var platformName = '';
    if (kIsWeb) {
      platformName = webBrowserInfo!.browserName.name.toString().capitalize();
    } else {
      if (Platform.isIOS) {
        platformName = iosInfo!.systemName.toString();
      }

      if (Platform.isMacOS) {
        platformName = macOsInfo!.model.toString();
      }

      if (Platform.isAndroid) {
        platformName = 'Android';
      }
    }
    return platformName;
  }

  IconData getPlatformIcon() {
    if (kIsWeb) {
      return Icons.laptop;
    } else {
      if (Platform.isIOS) {
        if (Device.get().isTablet) {
          return Icons.tablet;
        } else {
          return Icons.phone_android;
        }
      }

      if (Platform.isMacOS) {
        return Icons.laptop;
      }

      if (Platform.isAndroid) {
        if (Device.get().isTablet) {
          return Icons.tablet;
        } else {
          return Icons.phone_android;
        }
      }
    }
    return Icons.laptop;
  }

  bool disableAppBar() {
    var disable = false;
    if (kIsWeb) {
      disable = true;
    }
    return disable;
  }
}
