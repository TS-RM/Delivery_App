import 'package:tashil_food_app/data/firebase/crud_firebase.dart';
import 'package:tashil_food_app/data/paymet/model/payment_model.dart';

class PaymentService {
  Future<List<PaymentModel>?> getAllPaymentMethod() async {
    final data =
        await CrudFirebase().readDataAllNotEither(tableName: 'PaymentTypes');
    if (data != null) {
      final dataReturn =
          data.map((value) => PaymentModel.fromJson(value)).toList();
      return dataReturn;
    } else {
      return null;
    }
  }
}
