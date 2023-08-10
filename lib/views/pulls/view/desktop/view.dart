import 'package:github_explorer/config/colors.dart';
import 'package:github_explorer/layouts/desktop/default.dart';
import 'package:github_explorer/scaffold/desktop/default.dart';
import 'package:github_explorer/views/base.dart';
import 'package:github_explorer/views/pulls/controller/controller.dart';
import 'package:flutter/material.dart';

class PullsDesktopView extends StatefulWidget {
  const PullsDesktopView({Key? key, required this.controller})
      : super(key: key);

  final PullsController controller;

  @override
  State<PullsDesktopView> createState() => _PullsDesktopViewState();
}

class _PullsDesktopViewState
    extends BaseViewStatefulState<PullsDesktopView> {
  @override
  Widget build(BuildContext context) {
    return const DefaultDesktopScaffold(
      body: DefaultDesktopLayout(
        content: Center(
          child: Text(
            'Desktop Pulls',
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
    return 'PullsDesktop';
  }
}
