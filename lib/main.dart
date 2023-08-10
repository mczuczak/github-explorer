import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:github_explorer/config/colors.dart';
import 'package:github_explorer/config/constants.dart';
import 'package:github_explorer/controllers/app.dart';
import 'package:github_explorer/controllers/auth.dart';
import 'package:github_explorer/observers/nav_observer.dart';
import 'package:github_explorer/routes/routes.dart';
import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  var delegate = await LocalizationDelegate.create(
    fallbackLocale: ConfigConstants.locales.first,
    basePath: 'assets/i18n/',
    supportedLocales: ConfigConstants.locales,
  );

  if (!kIsWeb) {
    if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
      await DesktopWindow.setWindowSize(
        const Size(
          ConfigConstants.defaultWindowSizeWidth,
          ConfigConstants.defaultWindowSizeHeight,
        ),
      );
      await DesktopWindow.setMinWindowSize(
        const Size(
          ConfigConstants.minWindowSizeWidth,
          ConfigConstants.minWindowSizeHeight,
        ),
      );
    }
  }

  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    LocalizedApp(
      delegate,
      Builder(builder: (context) {
        var localizationDelegate = LocalizedApp.of(context).delegate;
        return LocalizationProvider(
          state: LocalizationProvider.of(context).state,
          child: MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (BuildContext context) =>
                    AppController(localizationDelegate, context),
              ),
              ChangeNotifierProvider(
                create: (BuildContext context) => AuthController(context),
              ),
            ],
            child: Consumer<AppController>(builder: (context, app, child) {
              return Consumer<AuthController>(builder: (context, auth, child) {
                return GithubExplorer(
                  localizationDelegate: localizationDelegate,
                  appController: app,
                  authController: auth,
                );
              });
            }),
          ),
        );
      }),
    ),
  );
}

class GithubExplorer extends StatefulWidget {
  const GithubExplorer(
      {Key? key,
      required this.localizationDelegate,
      required this.appController,
      required this.authController})
      : super(key: key);
  final LocalizationDelegate localizationDelegate;
  final AppController appController;
  final AuthController authController;

  @override
  State<GithubExplorer> createState() => _GithubExplorerState();
}

class _GithubExplorerState extends State<GithubExplorer> {
  late final GoRouter router;
  @override
  void initState() {
    router = GoRouter(
      initialLocation:
          (widget.authController.shouldLoadInitial(widget.appController))
              ? widget.appController.initialPathWeb()
              : Routes.loading,
      redirect: (BuildContext context, GoRouterState state) =>
          widget.appController.routerRedirection(state, widget.authController),
      refreshListenable: widget.authController,
      routes: <RouteBase>[
        ShellRoute(
          builder: (context, state, widget) {
            return widget;
          },
          navigatorKey: widget.appController.navigatorKey,
          routes: Routes.routes,
        ),
      ],
      debugLogDiagnostics: true,
      observers: [
        NavObserver(),
      ],
    );
    super.initState();
    init();
  }

  void init() async {
    await widget.appController
        .registerGlobalControllers(widget.appController, widget.authController);
    await widget.appController.loadDeviceInfo();
    await widget.appController.registerServices();
    await widget.appController.registerHelpers();
    await widget.authController.authorize();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: ConfigConstants.title,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
      routerDelegate: router.routerDelegate,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        widget.localizationDelegate
      ],
      supportedLocales: widget.localizationDelegate.supportedLocales,
      locale: widget.localizationDelegate.currentLocale,
      theme: ThemeData(
        fontFamily: ConfigConstants.fontFamily,
        primarySwatch: const MaterialColor(0xFF032d45, ConfigColors.mainSwatch),
        appBarTheme: const AppBarTheme(
          elevation: 0.0,
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            backgroundColor: ConfigColors.main,
            foregroundColor: ConfigColors.white,
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
        bottomAppBarTheme: const BottomAppBarTheme(
            color: MaterialColor(0xFF032d45, ConfigColors.mainSwatch)),
      ),
    );
  }
}
