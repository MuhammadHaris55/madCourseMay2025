import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mad_course_may_2025/navigation/route_paths.dart';
import 'package:mad_course_may_2025/ui/appbar/app_bar.dart';
import 'package:mad_course_may_2025/ui/app_text.dart';
import 'package:mad_course_may_2025/ui/app_text_field.dart';
import 'package:mad_course_may_2025/ui/appbar/app_bar_back_button.dart';
import 'package:mad_course_may_2025/utils/app_font.dart';

/// The home screen
class ThemingScreen extends StatelessWidget {
  /// Constructs a [ThemingScreen]
  ThemingScreen({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        backButton: AppBarBackButton(
            onPressed: () => context.go(RoutePaths.homeScreen)),
        title: AppText(
          text: "Theming",
          fontFamily: AppFont.midfielder,
        ),
        closeIcon: const SizedBox.shrink(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            AppText(text: "Enter your details"),
            const SizedBox(height: 15),
            const SizedBox(height: 15),
            AppText(
                text: "Please enter correct information",
                fontWeight: FontWeight.bold),
            const SizedBox(height: 15),
            AppTextField(
                controller: nameController,
                hintText: "Disable Field",
                isEnable: false),
            const SizedBox(height: 15),
            AppTextField(
              controller: emailController,
              hintText: "Enter your Email",
            ),
            const SizedBox(height: 15),
            AppTextField(
              controller: ageController,
              hintText: "Enter your Age",
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
