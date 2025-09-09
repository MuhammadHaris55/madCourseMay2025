import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mad_course_may_2025/navigation/app_router.dart';
import 'package:mad_course_may_2025/providers/counter_provider.dart';
import 'package:mad_course_may_2025/utils/app_font.dart';
import 'package:mad_course_may_2025/utils/color_palette.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      messagingSenderId: "369649154242", // project_info["project_number"]
      projectId: "mad-course-may-25", // project_info["project_id"]
      appId:
          "1:369649154242:android:a7f91c0119e1c0d268a35b", // client[0]["client_info"]["mobilesdk_app_id"]
      apiKey:
          "AIzaSyAHaZHRvD0o_Taa6jrAawCijuTR4Mx-6So", // client[0]["api_key"][0]["current_key"]
    ),
  );
  // await Firebase.initializeApp(
  //   options: const FirebaseOptions(
  //     messagingSenderId: "689395778413", // project_info["project_number"]
  //     projectId: "fir-tutorial-b065f", // project_info["project_id"]
  //     appId:
  //         "1:689395778413:android:389294feb36e3c9e701064", // client[0]["client_info"]["mobilesdk_app_id"]
  //     apiKey:
  //         "AIzaSyCRbXK2Vv5_ZutTdM6VPVuHEM_rofExq1M", // client[0]["api_key"][0]["current_key"]
  //   ),
  // );
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
      child: Sizer(
        builder: (context, orientation, deviceType) {
          return MaterialApp.router(
            routerConfig: router,
            //? Second way of routing without routing package
            // return MaterialApp(
            //   onGenerateRoute: (settings) => generateRoute(settings),
            //   initialRoute: RoutePaths.homeScreen,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              fontFamily: AppFont.primaryFont,
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
              // text theming ========================
              textTheme: TextTheme(
                displayLarge: TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
                displayMedium: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
                displaySmall: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
                bodyLarge: TextStyle(fontSize: 16.sp, color: Colors.black87),
                bodyMedium: TextStyle(fontSize: 14.sp, color: Colors.black54),
                bodySmall: TextStyle(fontSize: 12.sp, color: Colors.black45),
                labelLarge: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: ColorPalette.primaryColor),
              ),
            ),
            darkTheme: ThemeData(
              fontFamily: AppFont.primaryFont,
              brightness: Brightness.dark,
              inputDecorationTheme: InputDecorationTheme(
                fillColor: ColorPalette.blueGreyColor,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(color: Colors.red),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide:
                      const BorderSide(color: ColorPalette.blueGreyColor),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(color: Colors.greenAccent),
                ),
              ),
            ),
            themeMode: ThemeMode.system,
          );
        },
      ),
    );
  }
}
