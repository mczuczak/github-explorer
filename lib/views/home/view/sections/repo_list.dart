import 'package:flutter/material.dart';
import 'package:github_explorer/components/common/gap.dart';
import 'package:github_explorer/components/typography/h3.dart';
import 'package:github_explorer/views/home/controller/controller.dart';
import 'package:github_explorer/views/home/view/sections/repo_item.dart';

class RepoListHome extends StatelessWidget {
  const RepoListHome({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final HomeScreenController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: H3('Results (${controller.model.totalItems})'),
          ),
          const Gap(
            height: 16,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.model.repos.length,
              itemBuilder: ((context, index) => Column(
                    children: [
                      RepoItemHome(
                        repo: controller.model.repos[index],
                      ),
                      if (index - 1 != controller.model.repos.length)
                        const Gap(
                          height: 8,
                        ),
                    ],
                  )),
            ),
          )
        ],
      ),
    );
  }
}
