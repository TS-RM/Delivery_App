import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tashil_food_app/constants/static_data/shared_preference.dart';
import 'package:tashil_food_app/data/cart/service/cart_hive_service.dart';
import 'package:tashil_food_app/data/firebase/auth_firebase.dart';
import 'package:tashil_food_app/data/firebase/firestore_auth.dart';
import 'package:tashil_food_app/data/services/auth_api.dart';
import 'package:tashil_food_app/presentation/widgets/get_snackbar.dart';
import 'package:tashil_food_app/routes/screen_name.dart';

class SettingsController extends GetxController {
  var switchThemeValue = false.obs;
  var langLocal = Get.deviceLocale?.languageCode.obs;
  var firstName = ''.obs;
  var lastName = ''.obs;
  var image = ''.obs;
  var email = ''.obs;
  var phone = ''.obs;
  var id = ''.obs;
  final sharedPref = SharedPref.instance;

  late String futureImg;
  File file = File('');
  var shared = SharedPref.instance;

  bool loading = false;

  void startLoading() {
    loading = true;
    update();
  }

  void stopLoading() {
    loading = false;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    // print("${shared.getString('image')}  5656655656656565");
    var x = shared.getString('image') == 'null';
    firstName.value = shared.getString('firstName') ?? 'null';
    lastName.value = shared.getString('lastName') ?? 'null';
    id.value = shared.getString('id') ?? 'null';
    email.value = shared.getString('email') ?? 'null';
    phone.value = shared.getString('phone_number') ?? 'null';
    image.value = x ? 'null' : '${shared.getString('image')}';
    // print(x);
    switchThemeValue.value = Get.isDarkMode ? true : false;
  }

  void choose() async {
    var image = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (image != null) {
      file = File(image.path);
    } else {
      getSnackbar(supTitle: 'لم تقم بـ أختيار صورة', title: "ملاحظة");
    }

    update();
  }

  void deleteChoose() async {
    if (file.path != '') {
      file = File('');
    }
    update();
  }

  void save(
      {required String fName,
      required String lName,
      required String phoneNumber}) async {
    final firebaseStorage = FirebaseStorage.instance;
    if (file.path != '') {
      startLoading();
      var snapshot = await firebaseStorage
          .ref()
          .child('ImgUser/${id.value}')
          .putFile(file);
      var downloadUrl = await snapshot.ref.getDownloadURL();
      if (downloadUrl.isNotEmpty) {
        image.value = downloadUrl;
        FireStoreUser().upDateDataImageAndName(
            tableName: 'Users',
            id: id.value,
            img: downloadUrl,
            firstName: fName,
            lastName: lName,
            phone: phoneNumber);
        file = File('');
      }
      // Get.offNamed(ScreenName.profileSetting);
      Get.back();
      stopLoading();
    } else {
      startLoading();
      FireStoreUser().upDateDataName(
          tableName: 'Users',
          id: id.value,
          firstName: fName,
          lastName: lName,
          phone: phoneNumber);
      stopLoading();
    }
    shared.setString('firstName', fName);
    shared.setString('lastName', lName);
    shared.setString('phone_number', phoneNumber);
    firstName.value = shared.getString('firstName') ?? 'null';
    lastName.value = shared.getString('lastName') ?? 'null';
    phone.value = shared.getString('phone_number') ?? 'null';
    Get.back();
    update();
  }

  void changePassword({
    required String email,
  }) async {
    startLoading();

    final result = await ServiceAuthFirebase().resetPassword(email);
    if (result == true) {
      getSnackbar(
          supTitle: 'تعليمات',
          title:
              "تم أرسال الرابط الي البريد قم بالذهاب الي البريد وغير كلمه السر");
      logout();
      stopLoading();
    } else {
      stopLoading();

      getSnackbar(supTitle: '', title: "Oops! Something went wrong.");
    }
    update();
  }

  void logout() {
    // AuthApi().logout();
    ServiceAuthFirebase().logOut();
    CartHiveService().deleteCartData();
    // shared.remove('token');
    // shared.remove("id");
    // shared.remove("phone_number");
    // shared.remove("email");
    // shared.remove("image");
    // shared.remove("name");
    // shared.remove('cartDataList');
    SharedPref().removeAllDataLocal();
    Get.offNamedUntil(
      ScreenName.loginScreen,
      (route) => false,
    );
    update();
  }
}
