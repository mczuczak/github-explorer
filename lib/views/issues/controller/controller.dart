import 'package:get_it/get_it.dart';
import 'package:github_explorer/controllers/base.dart';
import 'package:github_explorer/models/issue.dart';
import 'package:github_explorer/models/repo.dart';
import 'package:github_explorer/services/github.dart';
import 'package:github_explorer/views/issues/model/model.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class IssuesController extends BaseController {
  IssuesController(BuildContext context, dynamic extra) : super(context) {
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
    return 'IssuesController';
  }

  // VARIABLES
  final IssuesModel _model = IssuesModel();
  final RefreshController refreshController = RefreshController();

  // GETTERS
  IssuesModel get model => _model;

  //METHODS

  init() async {
    _model.currentPage = 1;
    _model.issues!.clear();
    _model.loading = true;

    _model.issues = await GetIt.I<GithubService>().getIssues(
      page: _model.currentPage,
      repo: _model.repo!.fullName,
    );

    if (!disposed) {
      notifyListeners();
    }

    if (_model.issues!.isNotEmpty) {
      _model.totalItems = _model.issues!.first.number;
      _model.totalPages = (_model.issues!.first.number / _model.perPage).ceil();
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
    List<Issue>? items = await GetIt.I<GithubService>().getIssues(
      page: _model.currentPage,
      repo: _model.repo!.fullName,
    );
    await processResponse(items);
    refreshController.loadComplete();
  }

  processResponse(List<Issue>? items) async {
    if (items!.isEmpty) return;
    for (var element in items) {
      _model.issues!.add(element);
    }
    if (!disposed) {
      notifyListeners();
    }
  }
}
