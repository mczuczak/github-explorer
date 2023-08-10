import 'package:github_explorer/routes/home.dart';
import 'package:github_explorer/routes/loading.dart';
import 'package:github_explorer/routes/sign_in.dart';

class Routes {
  Routes._();

  static const loading = '/loading';
  static const signInRoute = '/sign-in';
  static const homeRoute = '/';
  static const reposPageRoute = '/:repo';
  static const issuesRoute = '/:repo/issues';
  static const pullsRoute = '/:repo/pulls';

  static final routes = [
    LoadingRoute(path: loading),
    SignInRoute(path: signInRoute),
    HomeScreenRoute(path: homeRoute),
  ];
}
