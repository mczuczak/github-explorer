import 'package:flutter/material.dart';
import 'package:github_explorer/config/colors.dart';

class Body1 extends StatelessWidget {
  const Body1(
    this.text, {
    super.key,
    this.color = ConfigColors.main,
    this.align = TextAlign.start,
    this.fontWeight = FontWeight.w400,
    this.fontSize = 16,
  });

  final String text;
  final Color color;
  final TextAlign align;
  final FontWeight fontWeight;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
        height: 1.50,
        fontWeight: fontWeight,
      ),
    );
  }
}
