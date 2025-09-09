import 'package:flutter/material.dart';
import 'package:mad_course_may_2025/utils/color_palette.dart';

// ignore: must_be_immutable
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  Color? appBarColor;
  Widget backButton;
  Widget title;
  Widget closeIcon;

  CustomAppBar({
    super.key,
    Color? appBarColor,
    required this.backButton,
    required this.title,
    required this.closeIcon,
  });

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: appBarColor ?? ColorPalette.primaryColor,
      leading: backButton,
      title: title,
      actions: [
        Padding(
          padding: const EdgeInsets.only(
              right: 16), // same as default leading padding
          child: closeIcon,
        ),
      ],
    );
  }
}
