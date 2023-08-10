import 'package:github_explorer/config/colors.dart';
import 'package:github_explorer/layouts/desktop/default.dart';
import 'package:github_explorer/scaffold/desktop/default.dart';
import 'package:github_explorer/views/base.dart';
import 'package:github_explorer/views/repos-page/controller/controller.dart';
import 'package:flutter/material.dart';

class ReposPageDesktopView extends StatefulWidget {
  const ReposPageDesktopView({Key? key, required this.controller})
      : super(key: key);

  final ReposPageController controller;

  @override
  State<ReposPageDesktopView> createState() => _ReposPageDesktopViewState();
}

class _ReposPageDesktopViewState
    extends BaseViewStatefulState<ReposPageDesktopView> {
  @override
  Widget build(BuildContext context) {
    return const DefaultDesktopScaffold(
      body: DefaultDesktopLayout(
        content: Center(
          child: Text(
            'Desktop ReposPage',
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
    return 'ReposPageDesktop';
  }
}
