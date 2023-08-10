import 'package:flutter/material.dart';
import 'package:github_explorer/controllers/base.dart';
import 'package:github_explorer/views/loading/model/model.dart';

class LoadingController extends BaseController {
  LoadingController(BuildContext context) : super(context) {
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
    return 'LoadingController';
  }

  // VARIABLES
  final LoadingModel _model = LoadingModel();

  // GETTERS
  LoadingModel get model => _model;

  //METHODS
}
