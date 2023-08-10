import 'package:flutter/material.dart';
import 'package:github_explorer/config/colors.dart';
import 'package:github_explorer/fonts/faregular.dart';
import 'package:go_router/go_router.dart';

class PopArrowComponent extends StatelessWidget {
  const PopArrowComponent({super.key, this.color = ConfigColors.white});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 20,
      backgroundColor: ConfigColors.white.withOpacity(0),
      child: IconButton(
        splashRadius: 20,
        splashColor: ConfigColors.black,
        icon: Icon(
          FARegular.chevron_left,
          color: color,
        ),
        onPressed: () async => GoRouter.of(context).pop(),
      ),
    );
  }
}
