import 'package:github_explorer/config/constants.dart';
import 'package:flutter/widgets.dart';
import 'dart:developer' as developer;

abstract class BaseController extends ChangeNotifier {
  BaseController(this.context, {this.showLogs = true}) {
    if (showLogs) {
      developer.log(
        'Controller initialized [${name()}]',
        name: ConfigConstants.title,
      );
    }
  }

  // VARIABLES
  BuildContext context;
  String name();
  bool showLogs = true;
  bool _disposed = false;

  // GETTERS
  bool get disposed => _disposed;

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
    if (showLogs) {
      developer.log(
        'Controller disposed [${name()}]',
        name: ConfigConstants.title,
      );
    }
  }

  void printDebug(message, {category = ''}) {
    developer.log(
      '$message ${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}  [${(category != '') ? category : name()}]',
      name: ConfigConstants.title,
    );
  }
}
