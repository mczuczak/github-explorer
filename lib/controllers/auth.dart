import 'package:github_explorer/controllers/app.dart';
import 'package:github_explorer/controllers/base.dart';
import 'package:github_explorer/enums/auth_status.dart';
import 'package:flutter/widgets.dart';

class AuthController extends BaseController {
  AuthController(BuildContext context) : super(context);

  //OVERRIDES
  @override
  String name() {
    return 'AuthController';
  }

  // VARS
  bool firstRun = true;
  AuthStatus status = AuthStatus.isLoading;

  // METHODS

  bool shouldLoadInitial(app) {
    if (status == AuthStatus.isLoading) return false;
    var check = false;
    if ((status != AuthStatus.loggedIn &&
            AppController.noAuthRoutes.contains(app.initialPathWeb)) ||
        (status == AuthStatus.loggedIn &&
            !AppController.noAuthRoutes.contains(app.initialPathWeb))) {
      check = true;
    }
    return check;
  }

  Future<void> authorize() async {
    status = AuthStatus.loggedIn;
    notifyListeners();
  }

  void refreshListenable() {
    notifyListeners();
  }
}
