import 'package:flutter/material.dart';
import 'package:github_explorer/components/common/gap.dart';
import 'package:github_explorer/components/common/tile.dart';
import 'package:github_explorer/components/typography/body2.dart';
import 'package:github_explorer/components/typography/h4.dart';
import 'package:github_explorer/config/colors.dart';
import 'package:github_explorer/fonts/faregular.dart';
import 'package:github_explorer/models/issue.dart';
import 'package:intl/intl.dart';

class IssueItemIssues extends StatelessWidget {
  const IssueItemIssues({
    super.key,
    required this.issue,
  });

  final Issue issue;

  get parsedDate => DateFormat.yMMMd().format(DateTime.parse(issue.createdAt));

  @override
  Widget build(BuildContext context) {
    return TileComponent(
      child: Column(
        children: [
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.all(5),
                child: Icon(
                  FARegular.triangle_exclamation,
                  color: ConfigColors.caribbeanGreen,
                  size: 20,
                ),
              ),
              const Gap(
                width: 10,
              ),
              Expanded(
                child: H4(issue.title),
              ),
            ],
          ),
          const Gap(
            height: 5,
          ),
          Row(
            children: [
              Expanded(
                child: Body2(
                  '#${issue.number.toString()} opened on $parsedDate',
                ),
              ),
            ],
          ),
          Row(
            children: [
              const Expanded(child: SizedBox()),
              Body2(
                issue.user.login,
                fontSize: 12,
              ),
              const Gap(
                width: 10,
              ),
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: ConfigColors.white.withOpacity(.2),
                  image: DecorationImage(
                    image: NetworkImage(issue.user.avatarUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
