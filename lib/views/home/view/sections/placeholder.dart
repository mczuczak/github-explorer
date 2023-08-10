import 'package:flutter/material.dart';
import 'package:github_explorer/components/common/gap.dart';
import 'package:github_explorer/components/placeholders.dart';
import 'package:shimmer/shimmer.dart';

class PlaceholderHome extends StatelessWidget {
  const PlaceholderHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        enabled: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              TitlePlaceholder(width: 130),
              Gap(
                height: 35,
              ),
              ContentPlaceholder(
                lineType: ContentLineType.threeLines,
              ),
              Gap(
                height: 15,
              ),
              ContentPlaceholder(
                lineType: ContentLineType.threeLines,
              ),
              Gap(
                height: 15,
              ),
              ContentPlaceholder(
                lineType: ContentLineType.threeLines,
              ),
              Gap(
                height: 15,
              ),
              ContentPlaceholder(
                lineType: ContentLineType.threeLines,
              ),
              Gap(
                height: 15,
              ),
              ContentPlaceholder(
                lineType: ContentLineType.threeLines,
              ),
              Gap(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
