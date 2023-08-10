import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:github_explorer/controllers/base.dart';
import 'package:github_explorer/models/pagination.dart';
import 'package:github_explorer/services/github.dart';
import 'package:github_explorer/views/home/model/model.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeScreenController extends BaseController {
  HomeScreenController(BuildContext context) : super(context) {
    _model.notifyControllerListeners = () => {
          if (!disposed)
            {
              notifyListeners(),
            }
        };
    init();
  }

  // OVERRIDES
  @override
  String name() {
    return 'HomeScreenController';
  }

  // VARIABLES
  final HomeScreenModel _model = HomeScreenModel();
  final RefreshController refreshController = RefreshController();
  final TextEditingController searchController = TextEditingController();

  // GETTERS
  HomeScreenModel get model => _model;
  Timer? debounceSearch;

  //METHODS

  init() async {
    _model.currentPage = 1;
    _model.repos.clear();
    _model.loading = false;

    if (searchController.text.isNotEmpty) {
      _model.loading = true;
    }

    searchController.addListener(() {
      if (debounceSearch != null) {
        debounceSearch!.cancel();
      }

      debounceSearch = Timer(const Duration(milliseconds: 800), () async {
        if (searchController.text.isEmpty) {
          _model.repos.clear();
          _model.loading = false;

          notifyListeners();

          return;
        }

        _model.currentPage = 1;
        _model.repos.clear();
        _model.loading = true;

        notifyListeners();

        Pagination? response = await GetIt.I<GithubService>()
            .getRepos(query: searchController.text);

        if (response != null) {
          _model.totalItems = response.totalCount;
          _model.totalPages = (response.totalCount / _model.perPage).ceil();
        }

        await processResponse(response);

        await Future.delayed(const Duration(seconds: 1));
        _model.loading = false;

        notifyListeners();
      });
      notifyListeners();
    });

    if (!disposed) {
      notifyListeners();
    }

    if (searchController.text.isEmpty) {
      refreshController.refreshCompleted();
      return;
    }

    Pagination? response =
        await GetIt.I<GithubService>().getRepos(query: searchController.text);

    if (response != null) {
      _model.totalItems = response.totalCount;
      _model.totalPages = (response.totalCount / _model.perPage).ceil();
    }

    await processResponse(response);
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
    Pagination? response = await GetIt.I<GithubService>().getRepos(
      page: _model.currentPage,
      query: searchController.text,
    );
    await processResponse(response);
    refreshController.loadComplete();
  }

  processResponse(Pagination? response) async {
    if (response == null) return;
    for (var element in response.items) {
      _model.repos.add(element);
    }
    if (!disposed) {
      notifyListeners();
    }
  }
}
