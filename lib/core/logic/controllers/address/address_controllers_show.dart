import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tashil_food_app/constants/static_data/shared_preference.dart';
import 'package:tashil_food_app/data/address/model/address_model.dart';
import 'package:tashil_food_app/data/address/service/address_service.dart';
import 'package:tashil_food_app/data/address/service/hive_address_service.dart';

class AddressShowController extends GetxController {
  Set<Marker> markers = {};
  var address;
  List<AddressModel> allAddressUser = [];
  AddressModel addressModel = AddressModel();

  bool isLoading = false;
  bool inRoute = false;
  var storage = SharedPref.instance;

  void startLoading() {
    isLoading = true;
    update();
  }

  void stopLoading() {
    isLoading = false;
    update();
  }

  String allAddressUserLocal = '';
  @override
  void onInit() {
    inRoute = Get.arguments['inRoute'] as bool;

    // final localAddress = storage.getString('allAddressUser');
    // if (localAddress != null) {
    //   storage.remove('allAddressUser');
    //   allAddressUser = [];
    // }
    // allAddressUserLocal = storage.getString('allAddressUser') ?? '';
    // if (allAddressUserLocal != '') {
    //   final allAddress = AddressModel.decode(allAddressUserLocal);

    //   allAddressUser.addAll(allAddress);
    // } else {
    // }
    getDataAddress();
    super.onInit();
  }

  void getDataAddress() async {
    startLoading();
    String id = storage.getString('id') ?? '';
    if (id != '') {
      final dataAddress = await AddressService().getAllAddress(id);
      if (dataAddress != null) {
        // allAddressUser.addAll(dataAddress);
        for (var element in dataAddress) {
          AddressHiveService().addAddressData(addressModel: element);
        }
        // dataAddress.map((addressModel) =>
        //     AddressHiveService().addAddressData(addressModel: addressModel));
        // final String encodedData = AddressModel.encode(allAddressUser);
        // storage.setString('allAddressUser', encodedData);
      }
    }
    stopLoading();
    update();
  }

  addAddressInOrder(AddressModel addressModel) {
    final String encodedData = AddressModel.encodeModel(addressModel);
    storage.setString('AddressUser', encodedData);
  }

  saveAddress() {
    SharedPref.instance.setString("currentAddress", address);
    update();
  }

  deleteAddress(String id) {
    AddressHiveService().deleteAddressData(id);
    AddressService().deleteOneAddress(id);
  }
}
