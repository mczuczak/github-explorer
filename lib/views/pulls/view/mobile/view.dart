import 'package:flutter/services.dart';
import 'package:github_explorer/components/common/empty_list.dart';
import 'package:github_explorer/components/common/pop_arrow.dart';
import 'package:github_explorer/components/common/refresher.dart';
import 'package:github_explorer/config/colors.dart';
import 'package:github_explorer/layouts/mobile/default.dart';
import 'package:github_explorer/scaffold/mobile/default.dart';
import 'package:github_explorer/views/base.dart';
import 'package:github_explorer/views/pulls/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:github_explorer/views/pulls/view/sections/placeholder.dart';
import 'package:github_explorer/views/pulls/view/sections/pull_list.dart';

class PullsMobileView extends StatefulWidget {
  const PullsMobileView({Key? key, required this.controller}) : super(key: key);

  final PullsController controller;

  @override
  State<PullsMobileView> createState() => _PullsMobileViewState();
}

class _PullsMobileViewState extends BaseViewStatefulState<PullsMobileView> {
  @override
  Widget build(BuildContext context) {
    return DefaultMobileScaffold(
      appBarTitle: 'Pull requests',
      appBarSystemOverlayStyle: SystemUiOverlayStyle.dark,
      backgroundColor: ConfigColors.gray,
      leading: const PopArrowComponent(
        color: ConfigColors.main,
      ),
      body: DefaultMobileLayout(
        content: RefresherComponent(
          refreshController: widget.controller.refreshController,
          onRefresh: () async => await widget.controller.init(),
          onLoading: () async => await widget.controller.loadMore(),
          enablePullUp: widget.controller.model.totalPages >
              widget.controller.model.currentPage,
          child: ListView(
            children: [
              if (widget.controller.model.loading)
                const PlaceholderPulls()
              else if (widget.controller.model.pulls!.isNotEmpty)
                PullListPulls(
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
    return 'PullsMobile';
  }
}
