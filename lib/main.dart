import 'package:car_manager/routes/routes.dart';
import 'package:car_manager/screen/DetailScreen.dart';
import 'package:car_manager/screen/SplashScreen.dart';
import 'package:car_manager/screen/VerhicesScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'const/fonts.dart';
import 'get_di.dart';
import 'models/car.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(GetMaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final GoRouter routing = GoRouter(
    initialLocation: "/${Routes.splash}",
    routes: <RouteBase>[
      GoRoute(
        path: Routes.root,
        builder: (BuildContext context, GoRouterState state) {
          return const VehiclesScreen();
        },
        routes: <RouteBase>[
          GoRoute(path: Routes.splash,
              builder: (BuildContext context, GoRouterState state) {
            return const SplashScreen();
          }),
          GoRoute(path: Routes.vehicles,
              builder: (BuildContext context, GoRouterState state) {
                return const VehiclesScreen();
              }),
          GoRoute(path: Routes.detail,
              builder: (BuildContext context, GoRouterState state) {
                return const DetailScreen();
              }),
          GoRoute(path: Routes.update,
              builder: (BuildContext context, GoRouterState state) {
                return DetailScreen(car: state.extra as Car,);
              })
        ]
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(fontFamily: Fonts.sfProText),
      routerConfig: routing,
    );
  }
}
