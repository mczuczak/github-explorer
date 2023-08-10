import 'package:flutter/material.dart';
import 'package:github_explorer/controllers/base.dart';
import 'package:github_explorer/views/sign-in/model/model.dart';

class SignInController extends BaseController {
  SignInController(BuildContext context) : super(context) {
    _model.notifyControllerListeners = () => {
          if (!disposed)
            {
              notifyListeners(),
            }
        };
  }

  // OVERRIDES
  @override
  String name() {
    return 'SignInController';
  }

  // VARIABLES
  final SignInModel _model = SignInModel();

  // GETTERS
  SignInModel get model => _model;

  //METHODS
}
