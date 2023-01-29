import 'package:flutter/material.dart';
import 'package:tashil_food_app/constants/init/init_boxses.dart';
import 'package:tashil_food_app/data/auth/model/user_hive_model.dart';
import 'package:tashil_food_app/data/auth/model/user_model.dart';

class HiveAuth {
  String idBox = "myBox";

  UserHiveModel? getDataUser() {
    final box = Boxes.getUser();
    final data = box.get(idBox);
    if (data != null) {
      return data;
    } else {
      return null;
    }
  }

  Future addDataUser({
    required UsersModel dataUser,
  }) async {
    final box = Boxes.getUser();
    UserHiveModel dataUserHive = UserHiveModel()
      ..id = dataUser.id
      ..firstName = dataUser.firstName
      ..lastName = dataUser.lastName
      ..email = dataUser.email
      ..phoneNumber = dataUser.phoneNumber
      ..image = dataUser.image
      ..userType = dataUser.userType
      ..gender = dataUser.gender
      ..moneyAccount = dataUser.moneyAccount
      ..address = dataUser.address;
    await box.put(idBox, dataUserHive);
    debugPrint('${box.keys}');
    debugPrint('تم حفظ المستخدم في التخزين المحلي');
  }

  void deleteDataUser() {
    final box = Boxes.getUser();
    box.delete(idBox);
    debugPrint('تم حذف المستخدم بنجاح');
  }
}
