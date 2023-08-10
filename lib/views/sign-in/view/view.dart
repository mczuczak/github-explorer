import 'package:flutter/material.dart';
import 'package:github_explorer/components/common/responsive.dart';
import 'package:github_explorer/views/sign-in/controller/controller.dart';
import 'package:github_explorer/views/sign-in/view/desktop/view.dart';
import 'package:github_explorer/views/sign-in/view/mobile/view.dart';

class SignInView extends StatelessWidget {
  const SignInView({Key? key, required this.controller}) : super(key: key);

  final SignInController controller;

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: SignInMobileView(controller: controller),
      tablet: SignInMobileView(controller: controller),
      desktop: SignInDesktopView(controller: controller),
    );
  }
}
