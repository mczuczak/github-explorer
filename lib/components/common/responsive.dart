import 'package:github_explorer/config/constants.dart';
import 'package:github_explorer/controllers/app.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:developer' as developer;

class Responsive extends StatefulWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  const Responsive({
    Key? key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
  }) : super(key: key);

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < ConfigConstants.mobileBreakpoint;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < ConfigConstants.desktopBreakpoint &&
      MediaQuery.of(context).size.width >= ConfigConstants.mobileBreakpoint;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= ConfigConstants.desktopBreakpoint;

  @override
  State<Responsive> createState() => _ResponsiveState();
}

class _ResponsiveState extends State<Responsive> {
  late AppController appController;

  @override
  Widget build(BuildContext context) {
    appController = Provider.of<AppController>(context, listen: false);
    return LayoutBuilder(
      // If our width is more than ConfigConstants.desktopBreakpoint then we consider it a desktop
      builder: (context, constraints) {
        if (constraints.maxWidth >= ConfigConstants.desktopBreakpoint) {
          appController.previousScreenSize = appController.currentScreenSize;
          appController.currentScreenSize = 'DESKTOP';
          if (appController.currentScreenSize !=
              appController.previousScreenSize) {
            developer.log(
              'Screen size set [${appController.currentScreenSize}]',
              name: ConfigConstants.title,
            );
          }
          return widget.desktop;
        }
        // If width it less then ConfigConstants.desktopBreakpoint and more then ConfigConstants.mobileBreakpoint we consider it as tablet
        else if (constraints.maxWidth >= ConfigConstants.mobileBreakpoint) {
          appController.previousScreenSize = appController.currentScreenSize;
          appController.currentScreenSize = 'TABLET';
          if (appController.currentScreenSize !=
              appController.previousScreenSize) {
            developer.log(
              'Screen size set [${appController.currentScreenSize}]',
              name: ConfigConstants.title,
            );
          }
          return widget.tablet;
        }
        // Or less then that we called it mobile
        else {
          appController.previousScreenSize = appController.currentScreenSize;
          appController.currentScreenSize = 'MOBILE';
          if (appController.currentScreenSize !=
              appController.previousScreenSize) {
            developer.log(
              'Screen size set [${appController.currentScreenSize}]',
              name: ConfigConstants.title,
            );
          }
          return widget.mobile;
        }
      },
    );
  }
}
