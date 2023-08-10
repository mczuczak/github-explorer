import 'package:flutter/material.dart';
import 'package:github_explorer/config/colors.dart';

class H4 extends StatelessWidget {
  const H4(
    this.text, {
    super.key,
    this.color = ConfigColors.main,
    this.align = TextAlign.start,
    this.overflow = TextOverflow.ellipsis,
    this.fontSize = 14.0,
  });

  final String text;
  final Color color;
  final TextAlign align;
  final TextOverflow? overflow;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
        fontWeight: FontWeight.w600,
      ),
      overflow: overflow,
    );
  }
}
