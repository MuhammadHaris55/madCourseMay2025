import 'package:flutter/material.dart';
import 'package:mad_course_may_2025/ui/app_text.dart';
import 'package:mad_course_may_2025/ui/app_text_field.dart';

/// The home screen
class HomeScreen extends StatelessWidget {
  /// Constructs a [HomeScreen]
  HomeScreen({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Screen')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            AppText(text: "Enter your details"),
            const SizedBox(height: 15),
            const SizedBox(height: 15),
            AppText(
                text: "Please enter ccorrect information",
                fontWeight: FontWeight.bold),
            const SizedBox(height: 15),
            AppTextField(
                controller: nameController,
                hintText: "Enter your Name",
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
