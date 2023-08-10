import 'package:github_explorer/controllers/base.dart';
import 'package:github_explorer/models/repo.dart';
import 'package:github_explorer/views/repos-page/model/model.dart';
import 'package:flutter/material.dart';

class ReposPageController extends BaseController {
  ReposPageController(BuildContext context, dynamic extra) : super(context) {
    _model.notifyControllerListeners = () => {
          if (!disposed)
            {
              notifyListeners(),
            }
        };
    _model.repo = extra['repo'] as Repo;
  }

  // OVERRIDES
  @override
  String name() {
    return 'ReposPageController';
  }

  // VARIABLES
  final ReposPageModel _model = ReposPageModel();

  // GETTERS
  ReposPageModel get model => _model;

  //METHODS
}
