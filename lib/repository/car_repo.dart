import 'package:car_manager/models/car.dart';

import '../api/api_client.dart';
import 'package:get/get_connect/http/src/response/response.dart';

import '../const/strings.dart';

class CarRepo {
  late final ApiClient apiClient;

  CarRepo({required this.apiClient});

  Future<Response> getAllCar() async {
    return apiClient.getData(AppConfig.allCar);
  }

  Future<Response> getCar(int id) async {
    return apiClient.getData(AppConfig.addCar, query: {"id": id});
  }

  Future<Response> addCar(Car car) {
    return apiClient.postData(AppConfig.addCar, car.toJson());
  }

  Future<Response> deleteCar(int id) {
    return apiClient.deleteData("${AppConfig.car}/$id");
  }

  Future<Response> updateCar(Car car) {
    return apiClient.putData("${AppConfig.updateCar}/${car.id}", car.toJson());
  }

  Future<Response> updateStatusCar(int id, bool status) {
    return apiClient.postData(AppConfig.updateStatusCar, {"id": id, "currentStatus": status});
  }
}
