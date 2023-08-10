import 'package:github_explorer/config/colors.dart';
import 'package:github_explorer/config/constants.dart';
import 'package:flutter/material.dart';
import 'package:github_explorer/layouts/mobile/default.dart';
import 'package:github_explorer/scaffold/mobile/default.dart';
import 'package:github_explorer/views/base.dart';
import 'package:github_explorer/views/sign-in/controller/controller.dart';
import 'package:flutter_translate/flutter_translate.dart';

class SignInMobileView extends StatefulWidget {
  const SignInMobileView({Key? key, required this.controller})
      : super(key: key);

  final SignInController controller;

  @override
  State<SignInMobileView> createState() => _SignInMobileViewState();
}

class _SignInMobileViewState extends BaseViewStatefulState<SignInMobileView> {
  @override
  Widget build(BuildContext context) {
    return DefaultMobileScaffold(
      appBarHeight: 0,
      body: DefaultMobileLayout(
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Text(
                ConfigConstants.title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 50.0,
                  fontWeight: FontWeight.w600,
                  color: ConfigColors.main,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              translate('init'),
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.w200,
                color: ConfigColors.main,
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  String name() {
    return 'SignInMobile';
  }
}
