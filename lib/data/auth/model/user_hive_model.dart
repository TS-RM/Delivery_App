import 'package:hive/hive.dart';

part 'user_hive_model.g.dart';

@HiveType(typeId: 0)
class UserHiveModel {
  @HiveField(0)
  String? id;

  @HiveField(1)
  String? firstName;

  @HiveField(2)
  String? lastName;

  @HiveField(3)
  String? email;

  @HiveField(4)
  String? phoneNumber;

  @HiveField(5)
  String? image;

  @HiveField(6)
  int? gender;

  @HiveField(7)
  String? address;

  @HiveField(8)
  String? moneyAccount;

  @HiveField(9)
  int? userType;
}
