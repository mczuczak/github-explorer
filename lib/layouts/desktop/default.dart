import 'package:github_explorer/controllers/app.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DefaultDesktopLayout extends StatefulWidget {
  const DefaultDesktopLayout({
    Key? key,
    required this.content,
  }) : super(key: key);

  final Widget content;

  @override
  State<DefaultDesktopLayout> createState() => _DefaultDesktopLayoutState();
}

class _DefaultDesktopLayoutState extends State<DefaultDesktopLayout> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppController>(
      builder: (context, provider, child) {
        return Directionality(
          textDirection: provider.textDirection,
          child: Scrollbar(
            controller: provider.globalScrollController,
            child: widget.content,
          ),
        );
      },
    );
  }
}
