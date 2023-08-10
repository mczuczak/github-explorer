import 'package:github_explorer/routes/repos_page.dart';
import 'package:github_explorer/routes/routes.dart';
import 'package:github_explorer/views/home/controller/controller.dart';
import 'package:github_explorer/views/home/view/view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class HomeScreenRoute extends GoRoute {
  HomeScreenRoute({required String path})
      : super(
          path: path,
          pageBuilder: (context, state) => NoTransitionPage(
            key: ValueKey('${path}Route'),
            child: Provider<HomeScreenController>(
              create: (_) => HomeScreenController(context),
              child: ChangeNotifierProvider(
                create: (_) => HomeScreenController(context),
                child: Consumer<HomeScreenController>(
                  builder: (context, controller, child) {
                    return HomeScreenView(
                      controller: controller,
                    );
                  },
                ),
              ),
            ),
          ),
          routes: [
            ReposPageRoute(
              name: Routes.reposPageRoute,
              path: Routes.reposPageRoute.replaceAll(
                Routes.homeRoute,
                '',
              ),
            ),
          ],
        );
}
