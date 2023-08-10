import 'package:flutter/widgets.dart';

class ZeroTransitionPage extends Page {
  final Widget child;

  const ZeroTransitionPage({required this.child, required LocalKey key})
      : super(key: key);

  @override
  Route createRoute(BuildContext context) {
    return PageRouteBuilder(
      settings: this,
      transitionDuration: Duration.zero,
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return child;
      },
    );
  }
}
