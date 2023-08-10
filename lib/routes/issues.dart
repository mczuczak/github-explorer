import 'package:github_explorer/transitions/slide_left_page.dart';
import 'package:github_explorer/views/issues/controller/controller.dart';
import 'package:github_explorer/views/issues/view/view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class IssuesRoute extends GoRoute {
  IssuesRoute({required String path, required String name})
      : super(
          path: path,
          name: name,
          pageBuilder: (context, state) => SlideLeftPage(
            key: ValueKey('${path}Route'),
            child: Provider<IssuesController>(
              create: (_) => IssuesController(context, state.extra as dynamic),
              child: ChangeNotifierProvider(
                create: (_) =>
                    IssuesController(context, state.extra as dynamic),
                child: Consumer<IssuesController>(
                  builder: (context, controller, child) {
                    return IssuesView(
                      controller: controller,
                    );
                  },
                ),
              ),
            ),
          ),
        );
}
