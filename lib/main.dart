import 'package:flutter/material.dart';
import 'package:mad_course_may_2025/navigation/app_router.dart';
import 'package:mad_course_may_2025/providers/counter_provider.dart';
import 'package:mad_course_may_2025/utils/color_palette.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //? Routing through Go_Router package
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CounterProvider()),
      ],
      child: MaterialApp.router(
        routerConfig: router,
        //? Second way of routing without routing package
        // return MaterialApp(
        //   onGenerateRoute: (settings) => generateRoute(settings),
        //   initialRoute: RoutePaths.homeScreen,
        theme: ThemeData(
          inputDecorationTheme: InputDecorationTheme(
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: Colors.red),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: Colors.blueAccent),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: Colors.amberAccent),
            ),
          ),
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          inputDecorationTheme: InputDecorationTheme(
            fillColor: ColorPalette.blueGreyColor,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: Colors.red),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: ColorPalette.blueGreyColor),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: Colors.greenAccent),
            ),
          ),
        ),
        themeMode: ThemeMode.system,
      ),
    );
  }
}
