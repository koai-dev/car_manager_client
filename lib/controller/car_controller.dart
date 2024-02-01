import 'package:car_manager/repository/car_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/car.dart';

class CarController extends GetxController implements GetxService {
  final CarRepo carRepo;

  CarController({required this.carRepo});

  bool isLoading = false;
  List<Car> listCar = [];
  Car? car;

  Future<void> getAllCar() async {
    isLoading = true;
    var response = await carRepo.getAllCar();
    listCar = [];
    response.body.forEach((car) {
      listCar.add(Car.fromJson(car));
    });
    isLoading = false;
    update();
  }

  Future<void> getCar(BuildContext context, {int id = 0}) async {
    isLoading = true;
    var response = await carRepo.getCar(id);
    car = Car.fromJson(response.body);
    isLoading = false;
    update();
  }

  Future<bool> addCar( {required Car car}) async {
    isLoading = true;
    var response = await carRepo.addCar(car);
    isLoading = false;
    update();
    return response.statusCode == 200;
  }

  Future<bool> deleteCar(BuildContext context, {required int id}) async {
    isLoading = true;
    var response = await carRepo.deleteCar(id);
    isLoading = false;
    update();
    return response.statusCode == 200;
  }

  Future<bool> updateCar({required Car car}) async {
    isLoading = true;
    var response = await carRepo.updateCar(car);
    isLoading = false;
    update();
    return response.statusCode == 200;
  }

  Future<bool> updateStatusCar({required int id, required bool status}) async {
    isLoading = true;
    var response = await carRepo.updateStatusCar(id, status);
    isLoading = false;
    update();
    return response.statusCode == 200;
  }
}
