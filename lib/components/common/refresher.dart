import 'package:flutter/material.dart';
import 'package:github_explorer/config/colors.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class RefresherComponent extends StatelessWidget {
  const RefresherComponent({
    Key? key,
    required this.refreshController,
    required this.onRefresh,
    required this.onLoading,
    required this.child,
    this.enablePullUp = false,
  }) : super(key: key);

  final RefreshController refreshController;
  final VoidCallback onRefresh;
  final VoidCallback onLoading;
  final bool enablePullUp;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      controller: refreshController,
      onRefresh: onRefresh,
      onLoading: onLoading,
      enablePullDown: true,
      enablePullUp: enablePullUp,
      header: const WaterDropMaterialHeader(
        backgroundColor: ConfigColors.white,
        color: ConfigColors.main,
      ),
      footer: const ClassicFooter(
        loadStyle: LoadStyle.ShowWhenLoading,
        height: 50,
        loadingIcon: SizedBox(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(
            strokeWidth: 2.0,
            color: Colors.grey,
          ),
        ),
        spacing: 20,
      ),
      child: child,
    );
  }
}
