import 'package:github_explorer/transitions/slide_left_page.dart';
import 'package:github_explorer/views/pulls/controller/controller.dart';
import 'package:github_explorer/views/pulls/view/view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class PullsRoute extends GoRoute {
  PullsRoute({required String path, required String name})
      : super(
          path: path,
          name: name,
          pageBuilder: (context, state) => SlideLeftPage(
            key: ValueKey('${path}Route'),
            child: Provider<PullsController>(
              create: (_) => PullsController(context, state.extra as dynamic),
              child: ChangeNotifierProvider(
                create: (_) => PullsController(context, state.extra as dynamic),
                child: Consumer<PullsController>(
                  builder: (context, controller, child) {
                    return PullsView(
                      controller: controller,
                    );
                  },
                ),
              ),
            ),
          ),
        );
}
