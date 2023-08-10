import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:github_explorer/components/common/refresher.dart';
import 'package:github_explorer/config/colors.dart';
import 'package:github_explorer/controllers/app.dart';
import 'package:github_explorer/layouts/mobile/default.dart';
import 'package:github_explorer/layouts/mobile/topbar/topbar.dart';
import 'package:github_explorer/scaffold/mobile/default.dart';
import 'package:github_explorer/views/base.dart';
import 'package:github_explorer/views/home/controller/controller.dart';
import 'package:github_explorer/components/common/empty_list.dart';
import 'package:github_explorer/views/home/view/sections/placeholder.dart';
import 'package:github_explorer/views/home/view/sections/repo_list.dart';

class HomeScreenMobileView extends StatefulWidget {
  const HomeScreenMobileView({Key? key, required this.controller})
      : super(key: key);

  final HomeScreenController controller;

  @override
  State<HomeScreenMobileView> createState() => _HomeScreenMobileViewState();
}

class _HomeScreenMobileViewState
    extends BaseViewStatefulState<HomeScreenMobileView> {
  @override
  Widget build(BuildContext context) {
    return DefaultMobileScaffold(
      appBarHeight: 160,
      backgroundColor: ConfigColors.gray,
      appBarFlexibleSpace: TopBar(
        controller: widget.controller,
      ),
      body: DefaultMobileLayout(
        content: RefresherComponent(
          refreshController: widget.controller.refreshController,
          onRefresh: () async => await widget.controller.init(),
          onLoading: () async => await widget.controller.loadMore(),
          enablePullUp: widget.controller.model.totalPages >
              widget.controller.model.currentPage,
          child: ListView(
            controller: GetIt.I<AppController>().globalScrollController,
            children: [
              if (widget.controller.model.loading)
                const PlaceholderHome()
              else if (widget.controller.model.repos.isNotEmpty)
                RepoListHome(
                  controller: widget.controller,
                )
              else
                const EmptyListComponent()
            ],
          ),
        ),
      ),
    );
  }

  @override
  String name() {
    return 'HomeScreenMobile';
  }
}
