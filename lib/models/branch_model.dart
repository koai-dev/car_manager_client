import 'dart:convert';

BranchModel branchModelFromJson(String str) =>
    BranchModel.fromJson(json.decode(str));

String branchModelToJson(BranchModel data) => json.encode(data.toJson());

class BranchModel {
  BranchModel({
    this.name,
    this.branchType,
    this.description,
    this.address,
    this.lon,
    this.lat,
    this.distance,
    this.phoneNumber,
    this.isAlwaysOpen,
    this.isNew,
    this.fax,
    this.premier,
    this.status,
  });

  BranchModel.fromJson(dynamic json) {
    name = json['name'];
    branchType = json['branchType'];
    description = json['description'];
    address = json['address'];
    lon = json['lon'];
    lat = json['lat'];
    distance = json['distance'];
    phoneNumber = json['phoneNumber'];
    isAlwaysOpen = json['isAlwaysOpen'];
    isNew = json['isNew'];
    fax = json['fax'];
    premier = json['premier'];
    status = json['status'];
  }

  String? name;
  String? branchType;
  String? description;
  String? address;
  num? lon;
  num? lat;
  dynamic distance;
  String? phoneNumber;
  bool? isAlwaysOpen;
  bool? isNew;
  String? fax;
  dynamic premier;
  dynamic status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['branchType'] = branchType;
    map['description'] = description;
    map['address'] = address;
    map['lon'] = lon;
    map['lat'] = lat;
    map['distance'] = distance;
    map['phoneNumber'] = phoneNumber;
    map['isAlwaysOpen'] = isAlwaysOpen;
    map['isNew'] = isNew;
    map['fax'] = fax;
    map['premier'] = premier;
    map['status'] = status;
    return map;
  }
}
