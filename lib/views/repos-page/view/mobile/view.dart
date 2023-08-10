import 'package:github_explorer/layouts/mobile/default.dart';
import 'package:github_explorer/scaffold/mobile/default.dart';
import 'package:github_explorer/views/base.dart';
import 'package:github_explorer/views/repos-page/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:github_explorer/views/repos-page/view/sections/content.dart';
import 'package:github_explorer/views/repos-page/view/sections/header.dart';

class ReposPageMobileView extends StatefulWidget {
  const ReposPageMobileView({Key? key, required this.controller})
      : super(key: key);

  final ReposPageController controller;

  @override
  State<ReposPageMobileView> createState() => _ReposPageMobileViewState();
}

class _ReposPageMobileViewState
    extends BaseViewStatefulState<ReposPageMobileView> {
  @override
  Widget build(BuildContext context) {
    return DefaultMobileScaffold(
      disableAppBar: true,
      body: DefaultMobileLayout(
        content: CustomScrollView(
          slivers: [
            ReposPageHeader(
              controller: widget.controller,
            ),
            ReposPageContent(
              controller: widget.controller,
            ),
          ],
        ),
      ),
    );
  }

  @override
  String name() {
    return 'ReposPageMobile';
  }
}
