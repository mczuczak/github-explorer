import 'package:github_explorer/config/constants.dart';
import 'package:flutter/widgets.dart';
import 'dart:developer' as developer;

abstract class BaseViewStatefulState<T extends StatefulWidget>
    extends State<T> {
  String name();

  BaseViewStatefulState() {
    developer.log(
      'View initialized [${name()}]',
      name: ConfigConstants.title,
    );
  }

  @override
  void dispose() {
    developer.log(
      'View disposed [${name()}]',
      name: ConfigConstants.title,
    );
    super.dispose();
  }
}
