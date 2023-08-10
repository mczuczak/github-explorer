import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:github_explorer/fonts/faregular.dart';
import 'package:go_router/go_router.dart';
import 'package:github_explorer/components/common/button.dart';
import 'package:github_explorer/components/typography/h4.dart';
import 'package:github_explorer/config/colors.dart';
import 'package:github_explorer/controllers/app.dart';
import 'package:github_explorer/routes/routes.dart';

class FiltersButtonComponent extends StatefulWidget {
  const FiltersButtonComponent({
    Key? key,
  }) : super(key: key);

  @override
  State<FiltersButtonComponent> createState() => _FiltersButtonComponentState();
}

class _FiltersButtonComponentState extends State<FiltersButtonComponent> {
  int? count = 1;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: 48,
          height: 48,
          child: ButtonComponent(
            disabled: true,
            content: const Icon(
              FARegular.sliders,
              color: ConfigColors.white,
              size: 18,
            ),
            onPressed: () async => GoRouter.of(
              GetIt.I<AppController>().navigatorKey.currentState!.context,
            ).pushNamed(
              Routes.homeRoute,
            ),
          ),
        ),
        if (count != null || count != 0)
          Positioned(
            right: 5,
            top: 5,
            child: IgnorePointer(
              child: CircleAvatar(
                backgroundColor: ConfigColors.pastelRed,
                radius: 8,
                child: H4(
                  count.toString(),
                  fontSize: 10,
                  color: ConfigColors.white,
                ),
              ),
            ),
          )
      ],
    );
  }
}
