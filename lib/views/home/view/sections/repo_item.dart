import 'package:get_it/get_it.dart';
import 'package:github_explorer/components/common/gap.dart';
import 'package:github_explorer/components/typography/body2.dart';
import 'package:github_explorer/components/typography/h4.dart';
import 'package:github_explorer/config/colors.dart';
import 'package:github_explorer/controllers/app.dart';
import 'package:github_explorer/models/repo.dart';
import 'package:flutter/material.dart';
import 'package:github_explorer/components/common/tile_button.dart';
import 'package:github_explorer/routes/routes.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class RepoItemHome extends StatelessWidget {
  const RepoItemHome({super.key, required this.repo});

  final Repo repo;

  get parsedDate => DateFormat.yMMMd().format(DateTime.parse(repo.updatedAt));

  @override
  Widget build(BuildContext context) {
    return TileButtonComponent(
      onPressed: () async {
        GoRouter.of(
          GetIt.I<AppController>().navigatorKey.currentState!.context,
        ).pushNamed<bool>(
          Routes.reposPageRoute,
          params: {'repo': repo.id.toString()},
          extra: {'repo': repo, 'controller': this},
        );
      },
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: ConfigColors.white.withOpacity(.2),
                  image: DecorationImage(
                    image: NetworkImage(repo.owner.avatarUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const Gap(
                width: 12,
              ),
              Expanded(
                child: H4(repo.fullName),
              ),
            ],
          ),
          if (repo.description != null)
            Column(
              children: [
                const Gap(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Body2(repo.description!),
                    ),
                  ],
                ),
              ],
            ),
          Column(
            children: [
              const Gap(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (repo.language != null)
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
                        repo.language!,
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
              )
            ],
          ),
        ],
      ),
    );
  }
}
