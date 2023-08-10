import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:github_explorer/components/common/gap.dart';
import 'package:github_explorer/config/colors.dart';
import 'package:github_explorer/controllers/app.dart';
import 'package:github_explorer/fonts/faregular.dart';
import 'package:github_explorer/routes/routes.dart';
import 'package:github_explorer/views/repos-page/controller/controller.dart';
import 'package:github_explorer/views/repos-page/view/sections/menu_item.dart';
import 'package:go_router/go_router.dart';

class MenuReposPage extends StatelessWidget {
  const MenuReposPage({
    super.key,
    required this.controller,
  });

  final ReposPageController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Gap(
          height: 10,
        ),
        MenuItemReposPage(
          color: ConfigColors.caribbeanGreen,
          icon: FARegular.triangle_exclamation,
          onPressed: () {
            GoRouter.of(
                    GetIt.I<AppController>().navigatorKey.currentState!.context)
                .pushNamed(
              Routes.issuesRoute,
              params: {'repo': controller.model.repo!.id.toString()},
              extra: {'repo': controller.model.repo, 'controller': this},
            );
          },
          title: 'Issues',
        ),
        MenuItemReposPage(
          color: ConfigColors.azure,
          icon: FARegular.code_pull_request,
          onPressed: () {
            GoRouter.of(
                    GetIt.I<AppController>().navigatorKey.currentState!.context)
                .pushNamed(
              Routes.pullsRoute,
              params: {'repo': controller.model.repo!.id.toString()},
              extra: {'repo': controller.model.repo, 'controller': this},
            );
          },
          title: 'Pull requests',
        ),
      ],
    );
  }
}
