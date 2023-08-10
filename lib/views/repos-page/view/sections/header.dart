import 'package:flutter/material.dart';
import 'package:github_explorer/components/common/pop_arrow.dart';
import 'package:github_explorer/components/typography/body2.dart';
import 'package:github_explorer/components/typography/h3.dart';
import 'package:github_explorer/components/typography/subtitle2.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:github_explorer/components/common/gap.dart';
import 'package:github_explorer/components/typography/h2.dart';
import 'package:github_explorer/config/colors.dart';
import 'package:github_explorer/fonts/faregular.dart';
import 'package:github_explorer/views/repos-page/controller/controller.dart';

class ReposPageHeader extends StatelessWidget {
  const ReposPageHeader({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final ReposPageController controller;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      pinned: true,
      backgroundColor: ConfigColors.main,
      expandedHeight: 215,
      collapsedHeight: 110,
      titleSpacing: 8,
      title: Row(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                PopArrowComponent(),
                Expanded(
                  child: H2(
                    'Overview',
                    color: ConfigColors.white,
                    align: TextAlign.center,
                  ),
                ),
                Gap(
                  width: 40,
                ),
              ],
            ),
          ),
        ],
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 60,
              right: 20,
              left: 20,
              bottom: 20,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: ConfigColors.gray,
                        ),
                        borderRadius: BorderRadius.circular(12),
                        color: ConfigColors.white.withOpacity(.2),
                        image: DecorationImage(
                          image: NetworkImage(
                            controller.model.repo!.owner.avatarUrl,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const Gap(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        H3(
                          controller.model.repo!.name,
                          color: ConfigColors.white,
                        ),
                        Subtitle2(
                          controller.model.repo!.owner.login,
                          color: ConfigColors.white,
                        ),
                      ],
                    ),
                  ],
                ),
                const Gap(
                  height: 15,
                ),
                InkWell(
                  onTap: () => launchUrl(
                    Uri.parse(
                        'https://github.com/${controller.model.repo!.fullName}'),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        FARegular.link,
                        size: 12,
                        color: ConfigColors.white,
                      ),
                      const Gap(
                        width: 10,
                      ),
                      Expanded(
                        child: Body2(
                          'https://github.com/${controller.model.repo!.fullName}',
                          color: ConfigColors.white,
                          fontSize: 12,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: double.infinity,
              height: 46,
              decoration: const BoxDecoration(
                color: ConfigColors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
