import 'package:tashil_food_app/data/firebase/crud_firebase.dart';
import 'package:tashil_food_app/data/order/model/order_model.dart';

class OrderService {
  Future<List<OrderModel>?> getOrderById(String userId, num status) async {
    final data = await CrudFirebase().readDataWhere2Field(
        tableName: 'Orders',
        fieldName1: 'WhoOrdered',
        value1: userId,
        fieldName2: 'Status',
        value2: status);
    if (data != null) {
      final dataReturn =
          data.map((value) => OrderModel.fromJson(value)).toList();
      return dataReturn;
    } else {
      return null;
    }
  }
}
