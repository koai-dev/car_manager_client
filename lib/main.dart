import 'package:car_manager/routes/routes.dart';
import 'package:car_manager/screen/DetailScreen.dart';
import 'package:car_manager/screen/SplashScreen.dart';
import 'package:car_manager/screen/VerhicesScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:go_router/go_router.dart';

import 'const/fonts.dart';
import 'firebase_options.dart';
import 'get_di.dart';
import 'models/car.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
  await FirebaseMessaging.instance.subscribeToTopic("noti");
  await FirebaseMessaging.instance.setAutoInitEnabled(true);
  listenWebSocket();
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await FirebaseMessaging.instance.subscribeToTopic("noti");
  await FirebaseMessaging.instance.setAutoInitEnabled(true);
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
