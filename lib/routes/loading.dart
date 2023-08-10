import 'package:github_explorer/views/loading/controller/controller.dart';
import 'package:github_explorer/views/loading/view/view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class LoadingRoute extends GoRoute {
  LoadingRoute({required String path})
      : super(
          path: path,
          pageBuilder: (context, state) => NoTransitionPage(
            key: ValueKey('${path}Route'),
            child: Provider<LoadingController>(
              create: (_) => LoadingController(context),
              child: ChangeNotifierProvider(
                create: (_) => LoadingController(context),
                child: Consumer<LoadingController>(
                  builder: (context, controller, child) {
                    return LoadingView(
                      controller: controller,
                    );
                  },
                ),
              ),
            ),
          ),
        );
}
