import 'package:flutter/material.dart';
import 'package:github_explorer/config/colors.dart';

class TileComponent extends StatelessWidget {
  const TileComponent({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(0, 1),
                    blurRadius: 5,
                    color: Color.fromRGBO(0, 0, 0, 0.03),
                  )
                ],
                borderRadius: BorderRadius.circular(8),
                color: ConfigColors.white,
                border: Border.all(
                  color: ConfigColors.mischka,
                )),
            child: child,
          ),
        ),
      ],
    );
  }
}
