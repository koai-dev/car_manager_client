import 'package:flutter/services.dart';

class Languages{
  static const String english = "en";
  static const String vietnamese = "vi";
}

class AppConfig{
  ///channel
  static const platform = MethodChannel('techcombank/ko.ai.dev');
  ///api
  static const String baseUrl = "edgem-roc-sit.techcombank.com.vn";

  static const String getAtm = "/api/tcb-atm-service/client-api/v1/atm/get-atms";
}

