import 'package:github_explorer/controllers/app.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DefaultMobileLayout extends StatefulWidget {
  const DefaultMobileLayout({
    Key? key,
    required this.content,
  }) : super(key: key);

  final Widget content;

  @override
  State<DefaultMobileLayout> createState() => _DefaultMobileLayoutState();
}

class _DefaultMobileLayoutState extends State<DefaultMobileLayout> {
  late AppController appController;

  @override
  Widget build(BuildContext context) {
    appController = Provider.of<AppController>(context, listen: true);

    return Directionality(
      textDirection: appController.textDirection,
      child: Scrollbar(
        key: const Key('MOBILE_SCROLLBAR'),
        controller: appController.globalScrollController,
        trackVisibility: false,
        child: widget.content,
      ),
    );
  }
}
