import 'package:github_explorer/config/colors.dart';
import 'package:github_explorer/layouts/desktop/default.dart';
import 'package:github_explorer/scaffold/desktop/default.dart';
import 'package:github_explorer/views/base.dart';
import 'package:github_explorer/views/home/controller/controller.dart';
import 'package:flutter/material.dart';

class HomeScreenDesktopView extends StatefulWidget {
  const HomeScreenDesktopView({Key? key, required this.controller})
      : super(key: key);

  final HomeScreenController controller;

  @override
  State<HomeScreenDesktopView> createState() => _HomeScreenDesktopViewState();
}

class _HomeScreenDesktopViewState
    extends BaseViewStatefulState<HomeScreenDesktopView> {
  @override
  Widget build(BuildContext context) {
    return const DefaultDesktopScaffold(
      body: DefaultDesktopLayout(
        content: Center(
          child: Text(
            'Desktop HomeScreen',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 50.0,
              fontWeight: FontWeight.w600,
              color: ConfigColors.main,
            ),
          ),
        ),
      ),
    );
  }

  @override
  String name() {
    return 'HomeScreenDesktop';
  }
}
