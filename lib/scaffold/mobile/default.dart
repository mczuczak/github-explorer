import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:github_explorer/components/typography/h2.dart';
import 'package:github_explorer/config/colors.dart';

class DefaultMobileScaffold extends StatelessWidget {
  const DefaultMobileScaffold({
    Key? key,
    required this.body,
    this.appBarBackgroundColor,
    this.appBarSystemOverlayStyle = SystemUiOverlayStyle.dark,
    this.backgroundColor,
    this.appBarHeight,
    this.appBarTitle,
    this.appBarFontSize = 20.0,
    this.disableBottomNavigation = false,
    this.leading,
    this.actions,
    this.bottom,
    this.bottomSheet,
    this.floatingActionButton,
    this.enableBottomBorder = false,
    this.disableAppBar = false,
    this.disableClient = false,
    this.appBarFlexibleSpace,
  }) : super(key: key);

  final Widget body;
  final Color? appBarBackgroundColor;
  final SystemUiOverlayStyle appBarSystemOverlayStyle;
  final Color? backgroundColor;
  final double? appBarHeight;
  final String? appBarTitle;
  final bool disableBottomNavigation;
  final Widget? leading;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;
  final Widget? bottomSheet;
  final bool enableBottomBorder;
  final bool disableAppBar;
  final double appBarFontSize;
  final bool disableClient;
  final Widget? floatingActionButton;
  final Widget? appBarFlexibleSpace;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          (backgroundColor != null) ? backgroundColor : Colors.white,
      appBar: (!disableAppBar)
          ? AppBar(
              toolbarHeight: appBarHeight,
              systemOverlayStyle: appBarSystemOverlayStyle,
              backgroundColor: (appBarBackgroundColor != null)
                  ? appBarBackgroundColor
                  : Colors.white,
              title: H2(
                (appBarTitle != null) ? appBarTitle! : '',
              ),
              foregroundColor:
                  (appBarSystemOverlayStyle == SystemUiOverlayStyle.light)
                      ? ConfigColors.white
                      : ConfigColors.main,
              centerTitle: true,
              automaticallyImplyLeading: (leading != null) ? false : true,
              leading: leading,
              actions: actions,
              bottom: (enableBottomBorder)
                  ? PreferredSize(
                      preferredSize: const Size.fromHeight(1),
                      child: Container(
                        color: Colors.white,
                        height: 1,
                      ),
                    )
                  : bottom,
              flexibleSpace: appBarFlexibleSpace,
            )
          : null,
      body: body,
      floatingActionButton: floatingActionButton,
      bottomSheet: bottomSheet,
    );
  }
}
