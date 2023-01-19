import 'package:firebase_auth/firebase_auth.dart';
import 'package:tashil_food_app/presentation/widgets/get_snackbar.dart';

class AlertErrorAuth {
  getAlertErrorInFirebase(FirebaseAuthException error) {
    switch (error.code) {
      case "user-not-found":
        getSnackbar(supTitle: '', title: "هاذا المستخدم غير موجود");
        break;
      case "wrong-password":
        getSnackbar(supTitle: '', title: "هناك خطأ في كلمة المرور");
        break;
      case "weak-password":
        getSnackbar(
            supTitle: '',
            title: "كلمة المرور التي أدخلتها ضعيفة أدخل كلمة مرور أخري");
        break;
      case "email-already-in-use":
        getSnackbar(
            supTitle: '',
            title: "هاذا البريد الالكتروني مسجل بالفعل تأكد من البريد المدخل");
        break;
      case "network-request-failed":
        getSnackbar(
            supTitle: '',
            title:
                "ليس لديك أتصال بالانترنت - قم بتوصيل الانترنت في هاتفك وأعادة المحاولة");
        break;
      default:
        getSnackbar(supTitle: '', title: "هناك خطأ ما");
        break;
    }
  }
}
