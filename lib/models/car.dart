import 'dart:convert';

Car branchModelFromJson(String str) =>
    Car.fromJson(json.decode(str));

String carToJson(Car data) => json.encode(data.toJson());

class Car {
  int? id;
  int? no;
  String? name;
  String? vehicleCategory;
  String? driverName;
  String? numberPlate;
  bool? currentStatus;
  String? usageStatus;
  String? usageYear;
  Car({
    this.id,
    this.no,
    this.name,
    this.vehicleCategory,
    this.driverName,
    this.numberPlate,
    this.currentStatus,
    this.usageStatus,
    this.usageYear,
  });

  Car.fromJson(dynamic json) {
    name = json['name'];
    id = json['id'];
    no = json['no'];
    vehicleCategory = json['vehicleCategory'];
    driverName = json['driverName'];
    numberPlate = json['numberPlate'];
    currentStatus = json['currentStatus'];
    usageYear = json['usageYear'];
    usageStatus = json['usageStatus'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['id'] = id;
    map['no'] = no;
    map['vehicleCategory'] = vehicleCategory;
    map['driverName'] = driverName;
    map['numberPlate'] = numberPlate;
    map['currentStatus'] = currentStatus;
    map['usageYear'] = usageYear;
    map['usageStatus'] = usageStatus;
    return map;
  }
}
