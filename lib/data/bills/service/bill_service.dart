import 'package:tashil_food_app/data/bills/model/bill_model.dart';
import 'package:tashil_food_app/data/firebase/crud_firebase.dart';

class BillService {
  Future<bool?> addBill(BillModel billModel) async {
    final data = await CrudFirebase()
        .createData(tableName: BillModel.tableName, data: billModel.toJson());
    if (data != null) {
      return true;
    } else {
      return false;
    }
  }
}
