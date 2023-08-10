import 'dart:ui';

import 'package:github_explorer/models/repo.dart';

class HomeScreenModel {
  HomeScreenModel({this.notifyControllerListeners});
  VoidCallback? notifyControllerListeners;

  bool loading = false;
  int currentPage = 1;
  int totalPages = 1;
  int totalItems = 1;
  int perPage = 30;
  List<Repo> repos = [];
}
