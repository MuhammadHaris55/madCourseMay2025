import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// The home screen
class HomeScreen extends StatelessWidget {
  /// Constructs a [HomeScreen]
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Screen')),
      body: Center(
        child: ElevatedButton(
          //? routing through Go_router package
          onPressed: () => context.go('/details'),
          //? Second way of routing without routing package
          // onPressed: () => Navigator.pushNamedAndRemoveUntil(context, RoutePaths.detailScreen, (route) => false),
          //? Default way of routing
          // onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const DetailsScreen()),),
          child: const Text('Go to the Details screen'),
        ),
      ),
    );
  }
}
