import 'package:flutter/material.dart';
import 'package:tashil_food_app/constants/init/init_boxses.dart';
import 'package:tashil_food_app/data/address/model/address_model.dart';

class AddressHiveService {
  String idBox = "myBoxAddress";

  AddressModel? getAddressData() {
    final box = Boxes.getAddressData();
    final data = box.get(idBox);
    if (data != null) {
      return data;
    } else {
      return null;
    }
  }

  Future addAddressData({
    required AddressModel addressModel,
  }) async {
    final box = Boxes.getAddressData();
    await box.put(addressModel.id, addressModel);
    debugPrint('${box.keys}');
    debugPrint('تم حفظ  في العناوين التخزين المحلي');
  }

  void deleteAddressData(String id) {
    final box = Boxes.getAddressData();
    box.delete(id);
    debugPrint('تم حذف  العناوين');
  }
}
