import 'package:car_manager/const/strings.dart';
import 'package:car_manager/controller/car_controller.dart';
import 'package:car_manager/repository/car_repo.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import 'api/api_client.dart';
import 'service/NotificationService.dart';
import 'package:web_socket_channel/status.dart' as status;

/// dependent injection in flutter (user 'get')
Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);

  Get.lazyPut(() => ApiClient());
  Get.lazyPut(() => CarRepo(apiClient: Get.find()));
  Get.lazyPut(() => CarController(carRepo: Get.find()));

  Get.lazyPut(() => NotificationService());
  final wsUrl = Uri.parse(AppConfig.baseWebsocket);
  var channel = WebSocketChannel.connect(wsUrl);
  await channel.ready;
  if (kDebugMode) {
    print("WEBSOCKET CONNECTED!");
  }
  channel.stream.listen((message) {
    if (kDebugMode) {
      print("WEBSOCKET $message");
    }
    Get.snackbar("Thông báo", message);
    if(!Get.find<CarController>().isLoading){
      Get.find<CarController>().getAllCar();
    }
    // Get.find<NotificationService>()
    //     .showNotification(title: "Thông báo", body: message);
  },onError:  (error) async {
    if (kDebugMode) {
      print("WEBSOCKET $error");
    }
    channel = WebSocketChannel.connect(wsUrl);
    await channel.ready;
    Get.lazyPut(() => channel);
  },onDone: (){
    if (kDebugMode) {
      print("WEBSOCKET DONE");
    }
  });
  Get.lazyPut(() => channel);
}
