import 'package:flutter/material.dart';
import 'package:github_explorer/scaffold/Desktop/default.dart';
import 'package:github_explorer/views/base.dart';
import 'package:github_explorer/views/loading/controller/controller.dart';

class LoadingDesktopView extends StatefulWidget {
  const LoadingDesktopView({Key? key, required this.controller})
      : super(key: key);

  final LoadingController controller;

  @override
  State<LoadingDesktopView> createState() => _LoadingDesktopViewState();
}

class _LoadingDesktopViewState
    extends BaseViewStatefulState<LoadingDesktopView> {
  @override
  Widget build(BuildContext context) {
    return const DefaultDesktopScaffold(
      body: Center(
        child: SizedBox(
          width: 40,
          height: 40,
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }

  @override
  String name() {
    return 'LoadingDesktop';
  }
}
