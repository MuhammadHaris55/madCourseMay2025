import 'package:flutter/material.dart';
import 'package:mad_course_may_2025/navigation/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //? Routing through Go_Router package
    return MaterialApp.router(
      routerConfig: router,
      //? Second way of routing without routing package
      // return MaterialApp(
      //   onGenerateRoute: (settings) => generateRoute(settings),
      //   initialRoute: RoutePaths.homeScreen,
    );
  }
}
