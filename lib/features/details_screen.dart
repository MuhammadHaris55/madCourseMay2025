import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// The details screen
class DetailsScreen extends StatelessWidget {
  /// Constructs a [DetailsScreen]
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Details Screen')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.go('/'),
          //? Second way of routing without routing package
          // onPressed: () => Navigator.pushNamedAndRemoveUntil(context, RoutePaths.home, (route) => false),
          child: const Text('Go back to the Home screen'),
        ),
      ),
    );
  }
}
