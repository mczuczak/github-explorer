import 'package:flutter/material.dart';
import 'package:github_explorer/components/common/gap.dart';
import 'package:github_explorer/components/typography/h3.dart';

class EmptyListComponent extends StatelessWidget {
  const EmptyListComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height -
          MediaQuery.of(context).padding.top -
          160,
      child: Column(
        children: [
          const Gap(
            height: 100,
          ),
          Image.asset(
            'assets/images/github-image.png',
            height: 150,
          ),
          const Gap(
            height: 10,
          ),
          const H3("What are you looking for?")
        ],
      ),
    );
  }
}
