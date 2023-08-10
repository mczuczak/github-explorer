import 'package:github_explorer/views/sign-in/controller/controller.dart';
import 'package:github_explorer/views/sign-in/view/view.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class SignInRoute extends GoRoute {
  SignInRoute({required String path})
      : super(
          path: path,
          pageBuilder: (context, state) => NoTransitionPage(
            key: ValueKey('${path}Route'),
            child: Provider<SignInController>(
              create: (_) => SignInController(context),
              child: ChangeNotifierProvider(
                create: (_) => SignInController(context),
                child: Consumer<SignInController>(
                  builder: (context, controller, child) {
                    return SignInView(
                      controller: controller,
                    );
                  },
                ),
              ),
            ),
          ),
        );
}
