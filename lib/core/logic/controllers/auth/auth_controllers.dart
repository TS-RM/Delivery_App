import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:get/get.dart';
import 'package:tashil_food_app/constants/static_data/shared_preference.dart';
import 'package:tashil_food_app/data/auth/service/hive_auth.dart';
import 'package:tashil_food_app/data/auth/model/user_model.dart';
import 'package:tashil_food_app/data/firebase/auth_firebase.dart';
import 'package:tashil_food_app/data/firebase/firestore_auth.dart';
import 'package:tashil_food_app/data/services/auth_api.dart';
import 'package:tashil_food_app/presentation/widgets/get_snackbar.dart';
import 'package:tashil_food_app/routes/screen_name.dart';

class AuthController extends GetxController {
  bool isVisibility = true;

  bool validate = true;
  String? currentTextPin;

  bool loading = false;

  Rxn<auth.User>? _user = Rxn<auth.User>();

  String? get user => _user?.value?.email;

  final _auth = auth.FirebaseAuth.instance;
  FireStoreUser fireStoreUser = FireStoreUser();
  final sharedPreference = SharedPref.instance;

  void visibility() {
    isVisibility = !isVisibility;

    update();
  }

  void currentTextPinCode(String value) {
    currentTextPin = value;
    update();
  }

  void startLoading() {
    loading = true;
    update();
  }

  void stopLording() {
    loading = false;
    update();
  }

  String? validatorPinCode(String value) {
    if (value.length < 3) {
      return "I'm from validator";
    } else {
      return null;
    }
  }

  void validatorTrue() {
    validate = true;

    update();
  }

  void validatorFalse() {
    validate = false;

    update();
  }

  void signUp(
      {required String phone,
      required String firstName,
      required String lastName,
      required String password,
      required String email}) async {
    try {
      startLoading();
      final user = await ServiceAuthFirebase().createNewUser(email, password);
      if (user != null) {
        UsersModel usersModel = UsersModel()
          ..id = user.user!.uid
          ..firstName = firstName
          ..lastName = lastName
          ..email = email
          ..phoneNumber = phone;
        final token = await user.user!.getIdToken();
        final userID = user.user!.uid;
        fireStoreUser.addUserToFireStore(usersModel);

        HiveAuth().addDataUser(dataUser: usersModel);
        if (token.isNotEmpty) {
          sharedPreference.setString("id", userID);
          sharedPreference.setString("token", token);
          sharedPreference.setString("phone_number", phone);
          sharedPreference.setString("email", email);
          sharedPreference.setString("firstName", firstName);
          sharedPreference.setString("lastName", lastName);
        }
        Get.toNamed(ScreenName.mainScreen);
        stopLording();
      }
      // Get.offAll(ControlView());
    } catch (error) {
      stopLording();
      String errorMessage =
          error.toString().substring(error.toString().indexOf(' ') + 1);
      Get.snackbar(
        'Failed to login..',
        errorMessage,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  //   void signUpWithGoogle() async {
  //   final user = await SocialMediaAuth().signInWithGoogle();
  //   print(user);
  // }
  Future<void> login({
    required String email,
    required String password,
  }) async {
    startLoading();

    try {
      final user = await ServiceAuthFirebase().signInAuth(email, password);
      if (user!.user!.uid.isNotEmpty) {
        final userData =
            await fireStoreUser.getUserFromFireStore(user.user!.uid);
        final token = await user.user!.getIdToken();
        final userID = user.user!.uid;
        if (token.isNotEmpty) {
          sharedPreference.setString("id", userID);
          sharedPreference.setString("token", token);
          sharedPreference.setString(
              "phone_number", userData.phoneNumber.toString());
          sharedPreference.setString("email", userData.email.toString());
          sharedPreference.setString("image", userData.image.toString());
          sharedPreference.setString(
              "firstName", userData.firstName.toString());
          sharedPreference.setString("lastName", userData.lastName.toString());
        }
        HiveAuth().addDataUser(dataUser: userData);
      }

      stopLording();

      if (user.user != null) {
        Get.toNamed(ScreenName.mainScreen);
      } else {
        getSnackbar(title: "Oops! Something went wrong.", supTitle: '');
      }
    } catch (e) {
      stopLording();
      getSnackbar(supTitle: '', title: "Oops! Something went wrong.");
    }
  }

  void resetPassword({
    required String email,
  }) async {
    startLoading();

    final result = await ServiceAuthFirebase().resetPassword(email);
    if (result == true) {
      getSnackbar(
          supTitle: 'تعليمات',
          title:
              "تم أرسال الرابط الي البريد قم بالذهاب الي البريد وغير كلمه السر");
      Get.back();
      stopLording();
    } else {
      stopLording();

      getSnackbar(supTitle: '', title: "Oops! Something went wrong.");
    }
    update();
  }

  Future<void> resetPasswordStep2({
    required String code,
  }) async {
    startLoading();

    bool result = await AuthApi().resetPasswordStep2(
      code: code,
    );
    if (result == true) {
      stopLording();

      Get.toNamed(ScreenName.newPwScreen, arguments: [
        {'code': code},
      ]);
    } else {
      stopLording();

      getSnackbar(supTitle: '', title: "Oops! Something went wrong.");
    }
  }

  Future<void> resetPasswordStep3({
    required String code,
    required String password,
  }) async {
    startLoading();

    bool result =
        await AuthApi().resetPasswordStep3(code: code, password: password);
    if (result == true) {
      stopLording();

      Get.toNamed(ScreenName.loginScreen);
    } else {
      stopLording();

      getSnackbar(supTitle: '', title: "Oops! Something went wrong.");
    }
  }
}
