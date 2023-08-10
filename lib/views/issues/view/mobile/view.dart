import 'package:flutter/services.dart';
import 'package:github_explorer/components/common/pop_arrow.dart';
import 'package:github_explorer/components/common/refresher.dart';
import 'package:github_explorer/config/colors.dart';
import 'package:github_explorer/layouts/mobile/default.dart';
import 'package:github_explorer/scaffold/mobile/default.dart';
import 'package:github_explorer/views/base.dart';
import 'package:github_explorer/components/common/empty_list.dart';
import 'package:github_explorer/views/issues/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:github_explorer/views/issues/view/sections/issue_list.dart';
import 'package:github_explorer/views/issues/view/sections/placeholder.dart';

class IssuesMobileView extends StatefulWidget {
  const IssuesMobileView({Key? key, required this.controller})
      : super(key: key);

  final IssuesController controller;

  @override
  State<IssuesMobileView> createState() => _IssuesMobileViewState();
}

class _IssuesMobileViewState extends BaseViewStatefulState<IssuesMobileView> {
  @override
  Widget build(BuildContext context) {
    return DefaultMobileScaffold(
      appBarTitle: 'Issues',
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
                const PlaceholderIssues()
              else if (widget.controller.model.issues!.isNotEmpty)
                IssueListIssues(
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
    return 'IssuesMobile';
  }
}
