import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'api/api_client.dart';

/// dependent injection in flutter (user 'get')
Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);

  Get.lazyPut(() => ApiClient());
  // Get.lazyPut(() => AtmAndBranchRepo(apiClient: Get.find()));
  // Get.lazyPut(() => AtmAndBranchController(atmAndBranchRepo: Get.find()));
}