import 'dart:async';
import 'dart:io';

import 'package:github_explorer/config/constants.dart';
import 'package:github_explorer/controllers/auth.dart';
import 'package:github_explorer/controllers/base.dart';
import 'package:github_explorer/enums/auth_status.dart';
import 'package:github_explorer/helpers/platform.dart';
import 'package:github_explorer/routes/routes.dart';
import 'package:github_explorer/services/auth.dart';
import 'package:github_explorer/services/github.dart';
import 'package:github_explorer/services/http.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import 'dart:developer' as developer;

import 'package:provider/provider.dart';

class AppController extends BaseController {
  AppController(LocalizationDelegate localizationDelegate, BuildContext context,
      {bool testEnv = false})
      : super(context) {
    developer.log(
      'App locale set: [${localizationDelegate.currentLocale}] TimeZone: [${DateTime.now().timeZoneName}]',
      name: ConfigConstants.title,
    );

    developer.log(
      'App current platform: [$defaultTargetPlatform]',
      name: ConfigConstants.title,
    );
    init();
  }

  //OVERRIDES
  @override
  String name() {
    return 'AppController';
  }

  // VARS
  String previousScreenSize = '';
  String currentScreenSize = '';
  ScrollController globalScrollController = ScrollController();
  bool contextSingletonsLoaded = false;
  TextDirection textDirection = TextDirection.ltr;
  final List<String> requestRetries = List<String>.empty(growable: true);
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  final deviceInfoPlugin = DeviceInfoPlugin();
  AndroidDeviceInfo? androidInfo;
  IosDeviceInfo? iosInfo;
  WebBrowserInfo? webBrowserInfo;
  MacOsDeviceInfo? macOsInfo;
  late StreamSubscription<bool> keyboardSubscription;
  bool isKeyboardVisible = false;
  final KeyboardVisibilityController keyboardVisibilityController =
      KeyboardVisibilityController();

  static final List<String> noAuthRoutes = [
    Routes.signInRoute,
  ];

  static final List<String> authStatusRoutes = [
    Routes.signInRoute,
  ];

  // METHODS
  void init() {
    changeLocale(context, ConfigConstants.locales.first);

    keyboardSubscription =
        keyboardVisibilityController.onChange.listen((bool visible) {
      isKeyboardVisible = visible;
      refreshListenable();
    });
  }

  String initialPathWeb() {
    if (kIsWeb) {
      return (Uri.base.path != Routes.signInRoute)
          ? Uri.base.path
          : Routes.loading;
    } else {
      if (Uri.base.pathSegments.isEmpty) {
        return Routes.loading;
      }
      return ('/${Uri.base.pathSegments.last}' != Routes.signInRoute)
          ? '/${Uri.base.pathSegments.last}'
          : Routes.loading;
    }
  }

  Future<void> registerServices() async {
    GetIt.I.registerSingleton<AuthService>(AuthService());
    printDebug('AuthService Singleton Registered.');
    GetIt.I.registerSingleton<HttpService>(HttpService());
    printDebug('HttpService Singleton Registered.');
    GetIt.I.registerSingleton<GithubService>(GithubService());
    printDebug('GithubService Singleton Registered.');
  }

  Future<void> registerHelpers() async {
    GetIt.I.registerSingleton<PlatformHelper>(PlatformHelper());
    printDebug('PlatformHelper Singleton Registered.');
  }

  Future<void> registerGlobalControllers(appController, authController) async {
    if (contextSingletonsLoaded == true) {
      return;
    }

    if (!GetIt.I.isRegistered(instance: appController)) {
      GetIt.I.registerSingleton<AppController>(appController);
      printDebug('AppController Singleton Registered.');
    }

    if (!GetIt.I.isRegistered(instance: authController)) {
      GetIt.I.registerSingleton<AuthController>(authController);
      printDebug('AuthController Singleton Registered.');
    }

    contextSingletonsLoaded = true;
  }

  Future<void> loadDeviceInfo() async {
    if (!kIsWeb && Platform.isAndroid) {
      androidInfo = await deviceInfoPlugin.androidInfo;
    }

    if (!kIsWeb && Platform.isIOS) {
      iosInfo = await deviceInfoPlugin.iosInfo;
    }

    if (!kIsWeb && Platform.isMacOS) {
      macOsInfo = await deviceInfoPlugin.macOsInfo;
    }

    if (kIsWeb) {
      webBrowserInfo = await deviceInfoPlugin.webBrowserInfo;
    }
  }

  Future<void> registerContextSingletons(ctx) async {
    if (contextSingletonsLoaded == true) {
      return;
    }
    if (!GetIt.I.isRegistered(
        instance: Provider.of<AppController>(ctx, listen: false))) {
      GetIt.I.registerSingleton<AppController>(
        Provider.of<AppController>(ctx, listen: false),
      );
      printDebug('AppController Singleton Registered.');
    }

    if (!GetIt.I.isRegistered(
        instance: Provider.of<AuthController>(ctx, listen: false))) {
      GetIt.I.registerSingleton<AuthController>(
        Provider.of<AuthController>(ctx, listen: false),
      );
      printDebug('AuthController Singleton Registered.');
    }
    contextSingletonsLoaded = true;
    await Future.delayed(const Duration(seconds: 2));
    GetIt.I<AuthController>().status = AuthStatus.loggedOut;
    GetIt.I<AuthController>().refreshListenable();
    notifyListeners();
  }

  String? routerRedirection(GoRouterState state, AuthController auth) {
    String? route;

    switch (auth.status) {
      case AuthStatus.loggedOut:
        route = (noAuthRoutes.contains(initialPathWeb()))
            ? initialPathWeb()
            : Routes.signInRoute;
        break;
      case AuthStatus.loggedIn:
        route = (kIsWeb &&
                initialPathWeb() != Routes.loading &&
                !noAuthRoutes.contains(initialPathWeb()))
            ? initialPathWeb()
            : Routes.homeRoute;
        break;
      case AuthStatus.isLoading:
        route = null;
        break;
    }

    if (auth.status == AuthStatus.loggedIn &&
        state.location != Routes.loading) {
      if (authStatusRoutes.contains(state.location)) {
        return Routes.homeRoute;
      } else {
        route = state.location;
      }
    }
    if (state.location != route && route != null) {
      return route;
    }

    return null;
  }

  void refreshListenable() {
    notifyListeners();
  }
}
