import 'dart:convert';

import 'package:hive/hive.dart';
part 'address_model.g.dart';

@HiveType(typeId: 3)
class AddressModel extends HiveObject {
  @HiveField(0)
  String? id;

  @HiveField(1)
  String? city;

  @HiveField(2)
  String? area;

  @HiveField(3)
  String? descAddress;

  @HiveField(4)
  String? homeType;

  @HiveField(5)
  String? nearby;

  @HiveField(6)
  String? state;

  @HiveField(7)
  String? street;

  @HiveField(8)
  String? addressInMap;

  @HiveField(9)
  String? userID;

  static String tableName = 'Addresses';

  AddressModel({
    this.id,
    this.city,
    this.area,
    this.street,
    this.homeType,
    this.nearby,
    this.state,
    this.descAddress,
    this.addressInMap,
    this.userID,
  });

  AddressModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    city = json['City'];
    homeType = json['HomeType'];
    nearby = json['Nearby'];
    state = json['State'];
    street = json['Street'];
    addressInMap = json['AddressInMap'];
    area = json['Area'];
    descAddress = json['DescAddress'];
    userID = json['UserID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['City'] = city;
    data['HomeType'] = homeType;
    data['Nearby'] = nearby;
    data['State'] = state;
    data['Street'] = street;
    data['AddressInMap'] = addressInMap;
    data['Area'] = area;
    data['DescAddress'] = descAddress;
    data['UserID'] = userID;
    return data;
  }

  static Map<String, dynamic> toMap(AddressModel address) => {
        'id': address.id,
        'City': address.city,
        'HomeType': address.homeType,
        'Nearby': address.nearby,
        'State': address.state,
        'Street': address.street,
        'AddressInMap': address.addressInMap,
        'DescAddress': address.descAddress,
        'Area': address.area,
        'UserID': address.userID,
      };
  static String encode(List<AddressModel> address) => json.encode(
        address
            .map<Map<String, dynamic>>((address) => AddressModel.toMap(address))
            .toList(),
      );

  static List<AddressModel> decode(String musics) =>
      (json.decode(musics) as List<dynamic>)
          .map<AddressModel>((item) => AddressModel.fromJson(item))
          .toList();

  static String encodeModel(AddressModel cart) => json.encode(cart.toJson());

  static AddressModel decodeModel(String musics) {
    final data = (json.decode(musics) as Map<String, dynamic>);
    final addressModel = AddressModel.fromJson(data);
    return addressModel;
  }
}
