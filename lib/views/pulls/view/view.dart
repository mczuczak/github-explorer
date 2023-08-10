import 'package:github_explorer/views/pulls/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:github_explorer/components/common/responsive.dart';
import 'package:github_explorer/views/pulls/view/desktop/view.dart';
import 'package:github_explorer/views/pulls/view/mobile/view.dart';

class PullsView extends StatelessWidget {
  const PullsView({Key? key, required this.controller}) : super(key: key);

  final PullsController controller;

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: PullsMobileView(controller: controller),
      tablet: PullsMobileView(controller: controller),
      desktop: PullsDesktopView(controller: controller),
    );
  }
}
