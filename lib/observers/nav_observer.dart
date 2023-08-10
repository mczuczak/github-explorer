import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class NavObserver extends NavigatorObserver {
  NavObserver();

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) async {
    if (GoRouter.of(route.navigator!.context).location != '/loading') {
      //GoRouter route has changed.
    }
  }
}
