import 'package:flutter/material.dart';
import 'package:github_explorer/config/colors.dart';
import 'package:github_explorer/fonts/faregular.dart';

class SearchComponent extends StatelessWidget {
  const SearchComponent({
    Key? key,
    required this.hintText,
    required this.onChanged,
    required this.controller,
  }) : super(key: key);

  final String hintText;
  final Function(String) onChanged;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      autocorrect: false,
      enableSuggestions: false,
      controller: controller,
      onChanged: onChanged,
      maxLines: 1,
      style: const TextStyle(
        fontSize: 15.0,
        fontWeight: FontWeight.w400,
        color: ConfigColors.paleSky,
      ),
      mouseCursor: SystemMouseCursors.click,
      decoration: InputDecoration(
        filled: true,
        fillColor: ConfigColors.white,
        prefixIcon: const Icon(
          FARegular.magnifying_glass,
          size: 18.0,
          color: ConfigColors.paleSky,
        ),
        prefixIconConstraints: const BoxConstraints(
          maxWidth: 48.0,
          minWidth: 48.0,
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: ConfigColors.mischka,
            width: 1.0,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: ConfigColors.mischka,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
        ),
        hintStyle: const TextStyle(
          fontSize: 16.0,
          color: ConfigColors.paleSky,
          fontWeight: FontWeight.w400,
        ),
        hintText: hintText,
        contentPadding: const EdgeInsets.only(
          left: 45.0,
          right: 0.0,
        ),
      ),
    );
  }
}
