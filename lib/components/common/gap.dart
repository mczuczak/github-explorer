import 'package:flutter/material.dart';

class Gap extends StatelessWidget {
  const Gap({
    Key? key,
    this.width = 24,
    this.height = 24,
  }) : super(key: key);

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
    );
  }
}
