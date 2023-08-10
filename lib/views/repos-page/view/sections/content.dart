import 'package:flutter/material.dart';
import 'package:github_explorer/components/typography/body2.dart';
import 'package:github_explorer/config/colors.dart';
import 'package:github_explorer/views/repos-page/controller/controller.dart';
import 'package:github_explorer/components/common/gap.dart';
import 'package:github_explorer/components/typography/h2.dart';
import 'package:github_explorer/views/repos-page/view/sections/menu.dart';
import 'package:intl/intl.dart';

class ReposPageContent extends StatelessWidget {
  const ReposPageContent({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final ReposPageController controller;

  get parsedDate => DateFormat.yMMMd()
      .format(DateTime.parse(controller.model.repo!.updatedAt));

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const H2('Description'),
                    if (controller.model.repo!.description != null)
                      Column(
                        children: [
                          const Gap(
                            height: 10,
                          ),
                          Body2(
                            controller.model.repo!.description!,
                          ),
                        ],
                      ),
                    const Gap(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (controller.model.repo!.language != null)
                          Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 3,
                              horizontal: 10,
                            ),
                            decoration: BoxDecoration(
                              color: ConfigColors.gray,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Body2(
                              controller.model.repo!.language!,
                              color: ConfigColors.main,
                              fontSize: 12,
                            ),
                          )
                        else
                          const SizedBox(),
                        Body2(
                          'Updated on $parsedDate',
                          fontSize: 12,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Gap(),
          MenuReposPage(
            controller: controller,
          ),
          Gap(
            height: MediaQuery.of(context).viewPadding.bottom + 100,
          )
        ],
      ),
    );
  }
}
