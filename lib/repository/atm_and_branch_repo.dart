import '../api/api_client.dart';
import 'package:get/get_connect/http/src/response/response.dart';

import '../const/strings.dart';

class AtmAndBranchRepo {
  late final ApiClient apiClient;

  AtmAndBranchRepo({required this.apiClient});

  /// @param branchType: BRANCH | ATM | CDM
  /// @param languag: en | vi
  Future<Response> getAtm(
      {String lat = "",
      String lon = "",
      String branchType = "BRANCH",
      int pageIndex = 0,
      int pageSize = 20,
      String nameOrAddress = "",
      String language = "en"}) async {
    var query = {
      "lat": lat,
      "lon": lon,
      "branchType": branchType,
      "pageIndex": "$pageIndex",
      "pageSize": "$pageSize",
      "nameOrAddress": nameOrAddress,
      "language": language
    };
    return apiClient.getData(AppConfig.getAtm, query: query);
  }
}
