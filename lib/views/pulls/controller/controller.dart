import 'package:get_it/get_it.dart';
import 'package:github_explorer/controllers/base.dart';
import 'package:github_explorer/models/pull.dart';
import 'package:github_explorer/models/repo.dart';
import 'package:github_explorer/services/github.dart';
import 'package:github_explorer/views/pulls/model/model.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class PullsController extends BaseController {
  PullsController(BuildContext context, dynamic extra) : super(context) {
    _model.notifyControllerListeners = () => {
          if (!disposed)
            {
              notifyListeners(),
            }
        };
    _model.repo = extra['repo'] as Repo;
    init();
  }

  // OVERRIDES
  @override
  String name() {
    return 'PullsController';
  }

  // VARIABLES
  final PullsModel _model = PullsModel();
  final RefreshController refreshController = RefreshController();

  // GETTERS
  PullsModel get model => _model;

  //METHODS

  init() async {
    _model.currentPage = 1;
    _model.pulls!.clear();
    _model.loading = true;

    _model.pulls = await GetIt.I<GithubService>().getPulls(
      page: _model.currentPage,
      repo: _model.repo!.fullName,
    );

    if (!disposed) {
      notifyListeners();
    }

    if (_model.pulls!.isNotEmpty) {
      _model.totalItems = _model.pulls!.first.number;
      _model.totalPages = (_model.pulls!.first.number / _model.perPage).ceil();
    }

    refreshController.refreshCompleted();
    await Future.delayed(const Duration(seconds: 1));
    _model.loading = false;
    if (!disposed) {
      notifyListeners();
    }
  }

  loadMore() async {
    if (_model.totalPages == _model.currentPage) return;
    _model.currentPage++;
    List<Pull>? items = await GetIt.I<GithubService>().getPulls(
      page: _model.currentPage,
      repo: _model.repo!.fullName,
    );
    await processResponse(items);
    refreshController.loadComplete();
  }

  processResponse(List<Pull>? items) async {
    if (items!.isEmpty) return;
    for (var element in items) {
      _model.pulls!.add(element);
    }
    if (!disposed) {
      notifyListeners();
    }
  }
}
