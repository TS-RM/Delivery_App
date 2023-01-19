import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static late final SharedPreferences instance;

  static Future<SharedPreferences> init() async =>
      instance = await SharedPreferences.getInstance();

  void removeAllDataLocal() {
    instance.remove('');
    instance.remove('cartDataList');
    instance.remove("currentAddress");
    instance.remove("AddressUser");
    instance.remove('allAddressUser');
    instance.remove('favoritesList');
    instance.remove('token');
    instance.remove("id");
    instance.remove("phone_number");
    instance.remove("email");
    instance.remove("image");
    instance.remove("firstName");
    instance.remove("lastName");
  }
}
