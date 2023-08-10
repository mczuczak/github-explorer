import 'package:flutter/material.dart';
import 'package:github_explorer/config/colors.dart';

class Subtitle1 extends StatelessWidget {
  const Subtitle1(
    this.text, {
    super.key,
    this.color = ConfigColors.main,
  });

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 15.0,
        color: color,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
