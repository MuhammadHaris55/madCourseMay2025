import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mad_course_may_2025/features/firestore_crud_screen.dart';
import 'package:mad_course_may_2025/features/home_screen.dart';
import 'package:mad_course_may_2025/features/theming_screen.dart';
import 'package:mad_course_may_2025/features/provider_screen.dart';
import 'package:mad_course_may_2025/navigation/route_paths.dart';

/// Routing throught Go_Router packages
final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: RoutePaths.homeScreen,
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: RoutePaths.themingScreen,
          builder: (BuildContext context, GoRouterState state) {
            return ThemingScreen();
          },
        ),
        GoRoute(
          path: RoutePaths.providerScreen,
          builder: (BuildContext context, GoRouterState state) {
            return const ProviderScreen();
          },
        ),
        GoRoute(
          path: RoutePaths.firestoreCrudScreen,
          builder: (BuildContext context, GoRouterState state) {
            return const FirestoreCrudScreen();
          },
        ),
      ],
    ),
  ],
);

//? Second way of routing without routing package
// Route<dynamic> generateRoute(RouteSettings routeSettings) {
//   switch (routeSettings.name) {
//     case RoutePaths.homeScreen:
//       return MaterialPageRoute(
//         builder: (_) => const HomeScreen(),
//       );

//     case RoutePaths.detailScreen:
//       return MaterialPageRoute(
//         builder: (_) => const DetailsScreen(),
//       );

//     default:
//       return MaterialPageRoute(
//         builder: (_) => const Scaffold(
//           body: Center(
//             child: Text('Page not found!'),
//           ),
//         ),
//       );
//   }
// }
