import 'package:flutter/material.dart';
import 'package:github_explorer/components/common/gap.dart';
import 'package:github_explorer/views/pulls/controller/controller.dart';
import 'package:github_explorer/views/pulls/view/sections/pull_item.dart';

class PullListPulls extends StatelessWidget {
  const PullListPulls({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final PullsController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(24),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: controller.model.pulls!.length,
        itemBuilder: ((context, index) => Column(
              children: [
                PullItemPulls(
                  pull: controller.model.pulls![index],
                ),
                if (index - 1 != controller.model.pulls!.length)
                  const Gap(
                    height: 8,
                  ),
              ],
            )),
      ),
    );
  }
}
