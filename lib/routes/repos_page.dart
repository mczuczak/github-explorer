import 'package:github_explorer/routes/issues.dart';
import 'package:github_explorer/routes/pulls.dart';
import 'package:github_explorer/routes/routes.dart';
import 'package:github_explorer/transitions/slide_left_page.dart';
import 'package:github_explorer/views/repos-page/controller/controller.dart';
import 'package:github_explorer/views/repos-page/view/view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ReposPageRoute extends GoRoute {
  ReposPageRoute({required String path, required String name})
      : super(
          path: path,
          name: name,
          pageBuilder: (context, state) => SlideLeftPage(
            key: ValueKey('${path}Route'),
            child: Provider<ReposPageController>(
              create: (_) =>
                  ReposPageController(context, state.extra as dynamic),
              child: ChangeNotifierProvider(
                create: (_) =>
                    ReposPageController(context, state.extra as dynamic),
                child: Consumer<ReposPageController>(
                  builder: (context, controller, child) {
                    return ReposPageView(
                      controller: controller,
                    );
                  },
                ),
              ),
            ),
          ),
          routes: [
            IssuesRoute(
              name: Routes.issuesRoute,
              path: Routes.issuesRoute.replaceAll(
                "${Routes.reposPageRoute}/",
                '',
              ),
            ),
            PullsRoute(
              name: Routes.pullsRoute,
              path: Routes.pullsRoute.replaceAll(
                "${Routes.reposPageRoute}/",
                '',
              ),
            ),
          ],
        );
}
