import 'package:github_explorer/config/colors.dart';
import 'package:github_explorer/layouts/desktop/default.dart';
import 'package:github_explorer/scaffold/desktop/default.dart';
import 'package:github_explorer/views/base.dart';
import 'package:github_explorer/views/issues/controller/controller.dart';
import 'package:flutter/material.dart';

class IssuesDesktopView extends StatefulWidget {
  const IssuesDesktopView({Key? key, required this.controller})
      : super(key: key);

  final IssuesController controller;

  @override
  State<IssuesDesktopView> createState() => _IssuesDesktopViewState();
}

class _IssuesDesktopViewState
    extends BaseViewStatefulState<IssuesDesktopView> {
  @override
  Widget build(BuildContext context) {
    return const DefaultDesktopScaffold(
      body: DefaultDesktopLayout(
        content: Center(
          child: Text(
            'Desktop Issues',
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
    return 'IssuesDesktop';
  }
}
