import 'package:flutter/services.dart';

class Languages{
  static const String english = "en";
  static const String vietnamese = "vi";
}

class AppConfig{
  ///channel
  static const platform = MethodChannel('techcombank/ko.ai.dev');
  ///api
  static const String baseUrl = "car-manager-bk-c08266cf8f56.herokuapp.com";
  static const String addCar = "/api/cars/add";
  static const String updateCar = "/api/cars";
  static const String car = "/api/cars";
  static const String allCar = "/api/cars/all";
  static const String updateStatusCar = "/api/cars/update_current_status";
  static const String baseWebsocket = 'wss://car-manager-bk-c08266cf8f56.herokuapp.com/carChannel';

}

