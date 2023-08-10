import 'dart:ui';

import 'package:github_explorer/models/repo.dart';

class ReposPageModel {
  ReposPageModel({this.notifyControllerListeners});
  VoidCallback? notifyControllerListeners;

  Repo? repo;
}
