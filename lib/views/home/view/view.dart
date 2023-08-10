import 'package:github_explorer/views/home/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:github_explorer/components/common/responsive.dart';
import 'package:github_explorer/views/home/view/desktop/view.dart';
import 'package:github_explorer/views/home/view/mobile/view.dart';

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({Key? key, required this.controller}) : super(key: key);

  final HomeScreenController controller;

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: HomeScreenMobileView(controller: controller),
      tablet: HomeScreenMobileView(controller: controller),
      desktop: HomeScreenDesktopView(controller: controller),
    );
  }
}
