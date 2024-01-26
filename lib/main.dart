import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:go_router/go_router.dart';

import 'const/fonts.dart';
import 'get_di.dart';

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
    routes: <RouteBase>[
      // GoRoute(
      //   path: Routes.root,
      //   builder: (BuildContext context, GoRouterState state) {
      //     // return const EnterAmountScreen(accountName: "Nguyen Kim Khanh", accountNumber: "0397293198231",);
      //     // return const AtmAndBranchScreen();
      //     return const TransferSuccessScreen();
      //   },
      //   routes: <RouteBase>[
      //     GoRoute(
      //       path: Routes.enterAmount,
      //       builder: (BuildContext context, GoRouterState state) {
      //         return const EnterAmountScreen(accountName: "Nguyen Kim Khanh", accountNumber: "0397293198231",);
      //       },
      //     ),
      //   ],
      // ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(fontFamily: Fonts.sfProText),
      routerConfig: routing,
      supportedLocales: const [
        // Locale(Languages.english),
        // Locale(Languages.vietnamese)
      ],
      // localizationsDelegates: AppLocalizations.localizationsDelegates,
    );
  }
}
