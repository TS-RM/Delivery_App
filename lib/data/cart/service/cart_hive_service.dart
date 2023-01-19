import 'package:flutter/material.dart';
import 'package:tashil_food_app/constants/init/init_boxses.dart';
import 'package:tashil_food_app/data/cart/model/cart_data_model.dart';

class CartHiveService {
  String idBox = "myBoxCart";

  CartDataModel? getCartData() {
    final box = Boxes.getCartData();
    final data = box.get(idBox);
    if (data != null) {
      return data;
    } else {
      return null;
    }
  }

  Future addCartData({
    required CartDataModel dataUser,
  }) async {
    deleteCartData();
    final box = Boxes.getCartData();
    await box.put(idBox, dataUser);
    debugPrint('${box.keys}');
    debugPrint('تم حفظ  في التخزين المحلي');
  }

  void deleteCartData() {
    final box = Boxes.getCartData();
    box.delete(idBox);
    debugPrint('تم حذف  بنجاح');
  }
}
