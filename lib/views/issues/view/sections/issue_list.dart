import 'package:flutter/material.dart';
import 'package:github_explorer/components/common/gap.dart';
import 'package:github_explorer/views/issues/controller/controller.dart';
import 'package:github_explorer/views/issues/view/sections/issue_item.dart';

class IssueListIssues extends StatelessWidget {
  const IssueListIssues({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final IssuesController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(24),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: controller.model.issues!.length,
        itemBuilder: ((context, index) => Column(
              children: [
                IssueItemIssues(
                  issue: controller.model.issues![index],
                ),
                if (index - 1 != controller.model.issues!.length)
                  const Gap(
                    height: 8,
                  ),
              ],
            )),
      ),
    );
  }
}
