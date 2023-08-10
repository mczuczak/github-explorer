import 'package:flutter/material.dart';
import 'package:github_explorer/config/colors.dart';

class H1 extends StatelessWidget {
  const H1(
    this.text, {
    super.key,
    this.color = ConfigColors.main,
    this.align = TextAlign.start,
    this.fontWeight = FontWeight.w600,
  });

  final String text;
  final Color color;
  final TextAlign align;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      style: TextStyle(
        fontSize: 24.0,
        color: color,
        fontWeight: fontWeight,
      ),
    );
  }
}
