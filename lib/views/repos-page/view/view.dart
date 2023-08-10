import 'package:github_explorer/views/repos-page/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:github_explorer/components/common/responsive.dart';
import 'package:github_explorer/views/repos-page/view/desktop/view.dart';
import 'package:github_explorer/views/repos-page/view/mobile/view.dart';

class ReposPageView extends StatelessWidget {
  const ReposPageView({Key? key, required this.controller}) : super(key: key);

  final ReposPageController controller;

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: ReposPageMobileView(controller: controller),
      tablet: ReposPageMobileView(controller: controller),
      desktop: ReposPageDesktopView(controller: controller),
    );
  }
}
