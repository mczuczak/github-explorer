import 'package:flutter/material.dart';
import 'package:github_explorer/config/colors.dart';

class H2 extends StatelessWidget {
  const H2(
    this.text, {
    super.key,
    this.color = ConfigColors.main,
    this.align = TextAlign.start,
    this.fontSize = 18.0,
    this.decoration,
  });

  final String text;
  final Color color;
  final TextAlign align;
  final double fontSize;
  final TextDecoration? decoration;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
        fontWeight: FontWeight.w600,
        decoration: decoration,
      ),
    );
  }
}
