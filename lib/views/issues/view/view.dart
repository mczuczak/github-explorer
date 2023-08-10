import 'package:github_explorer/views/issues/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:github_explorer/components/common/responsive.dart';
import 'package:github_explorer/views/issues/view/desktop/view.dart';
import 'package:github_explorer/views/issues/view/mobile/view.dart';

class IssuesView extends StatelessWidget {
  const IssuesView({Key? key, required this.controller}) : super(key: key);

  final IssuesController controller;

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: IssuesMobileView(controller: controller),
      tablet: IssuesMobileView(controller: controller),
      desktop: IssuesDesktopView(controller: controller),
    );
  }
}
