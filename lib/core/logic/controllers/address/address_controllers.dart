import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:permission_handler/permission_handler.dart';
import 'package:tashil_food_app/constants/static_data/shared_preference.dart';
import 'package:tashil_food_app/data/address/model/address_model.dart';
import 'package:tashil_food_app/data/address/service/address_service.dart';
import 'package:tashil_food_app/data/address/service/hive_address_service.dart';
import 'package:tashil_food_app/routes/screen_name.dart';

class AddressController extends GetxController {
  LatLng? latLng;
  CameraPosition? cameraPosition;
  GoogleMapController? controller;
  Set<Marker> markers = {};
  var address;
  List<AddressModel> allAddressUser = [];

  bool isLoading = false;
  bool isRoute = false;

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
    isRoute = Get.arguments['router'] as bool;

    cameraPosition = const CameraPosition(target: LatLng(0, 0), zoom: 10.0);
    getCurrentLocation();

    // allAddressUserLocal = storage.getString('allAddressUser') ?? '';
    // if (allAddressUserLocal != '') {
    //   final allAddress = AddressModel.decode(allAddressUserLocal);

    //   allAddressUser.addAll(allAddress);
    // } else {
    //   getDataAddress();
    // }
    super.onInit();
  }

  void getDataAddress() async {
    String id = storage.getString('id') ?? '';
    if (id != '') {
      final dataOrder = await AddressService().getAllAddress(id);
      if (dataOrder != null) {
        allAddressUser.addAll(dataOrder);
        final String encodedData = AddressModel.encode(allAddressUser);
        storage.setString('allAddressUser', encodedData);
      }
      update();
    }
  }

  Future getCurrentLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission != PermissionStatus.granted) {
      LocationPermission permission = await Geolocator.requestPermission();
      if (permission != PermissionStatus.granted) getLocation();
      return;
    }
    getLocation();
  }

  List<Placemark> results = [];
  getLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print(position.latitude);

    // latLng = LatLng(position.latitude, position.longitude);
    latLng = LatLng(position.latitude, position.longitude);
    // cameraPosition = CameraPosition(target: latLng, zoom: 20.0);
    cameraPosition = CameraPosition(target: latLng!, zoom: 20.0);
    if (controller != null) {
      controller!
          .animateCamera(CameraUpdate.newCameraPosition(cameraPosition!));
    }

    markers.add(Marker(
        markerId: const MarkerId("a"),
        draggable: true,
        position: latLng!,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        onDragEnd: (_currentlatLng) {
          latLng = _currentlatLng;
        }));
    getCurrentAddress();

    update();
  }

  getCurrentAddress() async {
    try {
      List<Placemark> placemark = await placemarkFromCoordinates(
          latLng!.latitude, latLng!.longitude,
          localeIdentifier: 'en');

      Placemark first = placemark.first;
      // print(first);
      if (placemark != null) {
        address = address = 'street ${first.street}';
        // print(first.locality);
      }
    } catch (e) {
      // print(e);
    }
    update();
  }

  saveAddress() {
    SharedPref.instance.setString("currentAddress", address);
    update();
  }

  addAddress({
    required String city,
    required String area,
    required String street,
    required String addressType,
    required String nearby,
    required String descAddress,
    required String addressInMap,
  }) async {
    print(isRoute);
    startLoading();

    final userId = storage.getString('id');
    AddressModel addressModel = AddressModel()
      ..city = city
      ..area = area
      ..street = street
      ..homeType = addressType
      ..state = "1"
      ..nearby = nearby
      ..descAddress = descAddress
      ..addressInMap = addressInMap
      ..userID = userId;
    try {
      final data =
          await AddressService().addToAddress(addressModel: addressModel);
      AddressHiveService().addAddressData(addressModel: data);
      // allAddressUser.add(data);
      // final String encodedData = AddressModel.encode(allAddressUser);
      // storage.setString('allAddressUser', encodedData);
      isRoute
          ? Get.offAndToNamed(ScreenName.showAddress,
              arguments: {'inRoute': true})
          : Get.offAndToNamed(
              ScreenName.showAddress,
            );
      stopLoading();
    } catch (error) {
      stopLoading();
      String errorMessage =
          error.toString().substring(error.toString().indexOf(' ') + 1);
      Get.snackbar(
        'Failed to login..',
        errorMessage,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
    update();
  }
}
