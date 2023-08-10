import 'package:flutter/material.dart';
import 'package:github_explorer/scaffold/mobile/default.dart';
import 'package:github_explorer/views/base.dart';
import 'package:github_explorer/views/loading/controller/controller.dart';

class LoadingMobileView extends StatefulWidget {
  const LoadingMobileView({Key? key, required this.controller})
      : super(key: key);

  final LoadingController controller;

  @override
  State<LoadingMobileView> createState() => _LoadingMobileViewState();
}

class _LoadingMobileViewState extends BaseViewStatefulState<LoadingMobileView> {
  @override
  Widget build(BuildContext context) {
    return const DefaultMobileScaffold(
      appBarHeight: 0,
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
    return 'LoadingMobile';
  }
}
