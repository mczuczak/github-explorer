import 'package:flutter/material.dart';
import 'package:github_explorer/components/common/filters_button.dart';
import 'package:github_explorer/components/common/gap.dart';
import 'package:github_explorer/components/common/logo.dart';
import 'package:github_explorer/components/common/search.dart';
import 'package:github_explorer/components/typography/h2.dart';
import 'package:github_explorer/components/typography/subtitle1.dart';
import 'package:github_explorer/views/home/controller/controller.dart';

class TopBar extends StatelessWidget {
  const TopBar({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final HomeScreenController controller;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  children: [
                    const Logo(),
                    const Gap(
                      width: 15,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Row(
                            children: const [
                              Expanded(
                                child: Subtitle1('How is it going? 👋🏼'),
                              ),
                            ],
                          ),
                          const Gap(
                            height: 2,
                          ),
                          Row(
                            children: const [
                              Expanded(
                                child: H2('Find your repository'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const Gap(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: SearchComponent(
                        hintText: 'Search',
                        onChanged: (v) => {},
                        controller: controller.searchController,
                      ),
                    ),
                    const Gap(
                      width: 8,
                    ),
                    const FiltersButtonComponent()
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
