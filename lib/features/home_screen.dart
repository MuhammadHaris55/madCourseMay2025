import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mad_course_may_2025/navigation/route_paths.dart';
import 'package:mad_course_may_2025/ui/appbar/app_bar.dart';
import 'package:mad_course_may_2025/ui/app_text.dart';
import 'package:mad_course_may_2025/ui/buttons/app_primary_button.dart';
import 'package:mad_course_may_2025/utils/app_font.dart';
import 'package:mad_course_may_2025/utils/color_palette.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        backButton: const SizedBox.shrink(),
        // backButton: AppBarBackButton(onPressed: () {}),
        title: AppText(
          text: "Home Screen",
          fontFamily: AppFont.midfielder,
        ),
        closeIcon: const SizedBox.shrink(),
        // closeIcon: AppBarCloseIcon(onPressed: () {}),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppButton(
              onPressed: () => context.go(RoutePaths.themingScreen),
              text: "Theming Class",
              buttonColor: ColorPalette.cpFF8383,
            ),
            const SizedBox(height: 20),
            AppButton(
              onPressed: () => context.go(RoutePaths.providerScreen),
              text: "Provider Class",
              buttonColor: ColorPalette.cpFF8383,
            ),
            const SizedBox(height: 20),
            AppButton(
              onPressed: () => context.go(RoutePaths.firestoreCrudScreen),
              text: "Firestore Class",
              buttonColor: ColorPalette.cpFF8383,
            ),
          ],
        ),
      ),
    );
  }
}
