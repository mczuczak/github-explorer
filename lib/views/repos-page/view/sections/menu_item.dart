import 'package:flutter/material.dart';
import 'package:github_explorer/config/colors.dart';
import 'package:github_explorer/fonts/faregular.dart';

class MenuItemReposPage extends StatelessWidget {
  const MenuItemReposPage({
    super.key,
    required this.color,
    required this.icon,
    required this.title,
    required this.onPressed,
  });

  final Color color;
  final IconData icon;
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPressed,
      leading: Container(
        width: 35,
        height: 35,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: color,
        ),
        child: Icon(
          icon,
          color: ConfigColors.white,
          size: 17,
        ),
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: ConfigColors.main,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: const Icon(
        FARegular.chevron_right,
        size: 18,
      ),
    );
  }
}
