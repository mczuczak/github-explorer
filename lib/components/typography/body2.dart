import 'package:flutter/material.dart';
import 'package:github_explorer/config/colors.dart';

class Body2 extends StatelessWidget {
  const Body2(
    this.text, {
    super.key,
    this.color = ConfigColors.main,
    this.align = TextAlign.start,
    this.fontWeight = FontWeight.w400,
    this.fontSize = 14.0,
    this.overflow = TextOverflow.visible,
  });

  final String text;
  final Color? color;
  final TextAlign align;
  final FontWeight fontWeight;
  final double fontSize;
  final TextOverflow overflow;

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
        overflow: overflow,
      ),
    );
  }
}
