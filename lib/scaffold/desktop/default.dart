import 'package:flutter/material.dart';

class DefaultDesktopScaffold extends StatelessWidget {
  const DefaultDesktopScaffold({Key? key, required this.body})
      : super(key: key);
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
      backgroundColor: Colors.white,
    );
  }
}
