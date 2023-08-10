import 'package:flutter/material.dart';
import 'package:github_explorer/components/common/responsive.dart';
import 'package:github_explorer/views/loading/controller/controller.dart';
import 'package:github_explorer/views/loading/view/desktop/view.dart';
import 'package:github_explorer/views/loading/view/mobile/view.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({Key? key, required this.controller}) : super(key: key);

  final LoadingController controller;

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: LoadingMobileView(controller: controller),
      tablet: LoadingMobileView(controller: controller),
      desktop: LoadingDesktopView(controller: controller),
    );
  }
}
