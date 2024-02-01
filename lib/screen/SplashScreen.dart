import 'dart:async';

import 'package:car_manager/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../const/fonts.dart';
import '../controller/car_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Get.find<CarController>().getAllCar();
    Timer(const Duration(milliseconds: 1500), (){
      context.go("/${Routes.vehicles}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(color: Colors.white),
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Ứng dụng quản lý xe\nPhòng Hậu cần',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF222222),
              fontSize: 16,
              fontFamily: Fonts.sfProText,
              fontWeight: FontWeight.w700,
              decoration: TextDecoration.none,
              height: 0,
            ),
          ),
          SizedBox(height: 337),
          Text(
            'Phiên bản 1.0',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF666666),
              fontSize: 11,
              fontFamily: Fonts.sfProText,
              fontWeight: FontWeight.w400,
              decoration: TextDecoration.none,
              height: 0,
            ),
          ),
        ],
      ),
    );
  }
}
