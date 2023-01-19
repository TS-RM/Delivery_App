import 'package:tashil_food_app/data/cart/model/cart_model.dart';
import 'package:tashil_food_app/data/firebase/crud_firebase.dart';
import 'package:tashil_food_app/data/meals/model/meal_model.dart';
import 'package:tashil_food_app/data/order/model/order_model.dart';

class CartServices {
  Future<OrderModel> addToOrder({
    required OrderModel orderModel,
  }) async {
    final order = await CrudFirebase()
        .createData(tableName: 'Orders', data: orderModel.toJson());
    if (order != null) {
      print(order);
      final data = OrderModel.fromJsonNotTimestamp(order);
      return data;
    } else {
      throw Exception('Gagal Login');
    }
  }

  Future<CartModel> addToCart({
    required CartModel cartModel,
    required String id,
  }) async {
    final cart = await CrudFirebase().createDataNested(
        tableName: 'Orders',
        id: id,
        tableName1: 'Cart',
        data: cartModel.toJson());
    if (cart != null) {
      final data = CartModel.fromJson(cart);
      return data;
    } else {
      throw Exception('Gagal Login');
    }
  }

  Future<MealModel> getMealById(String id) async {
    final data =
        await CrudFirebase().readDataOneRow(tableName: 'Meals', id: id);
    return MealModel.fromJson(data as Map<String, dynamic>);
  }

  // <OrderModel>
  Future<OrderModel?> getOrderById(String userId, num status) async {
    final data = await CrudFirebase().readDataWhere2Field(
        tableName: 'Orders',
        fieldName1: 'WhoOrdered',
        value1: userId,
        fieldName2: 'Status',
        value2: status);
    if (data != null) {
      final mapData = data[0];
      final orderModel = OrderModel.fromJson(mapData);
      return orderModel;
    } else {
      return null;
    }
  }

  Future<List<CartModel>?> getCartData(String id) async {
    final data = await CrudFirebase()
        .getDataNested(tableName: 'Orders', id: id, nestedTableName: 'Cart');
    if (data != null) {
      final returnData =
          data.map((value) => CartModel.fromJson(value)).toList();
      return returnData;
    } else {
      return null;
    }
  }

  void deleteItemInCart(String id, String idNested) async {
    final data = await CrudFirebase().deleteDataNested(
        tableName: 'Orders',
        id: id,
        nestedTableName: 'Cart',
        nestedId: idNested);
  }

  void deleteOrder(
    String idOrder,
  ) async {
    final data = await CrudFirebase().deleteData(
      tableName: 'Orders',
      id: idOrder,
    );
  }

  void updateMealToCart(String orderId, String cartId, CartModel cartModel) {
    CrudFirebase().upDateDataNested(
        tableName: 'Orders',
        id: orderId,
        nestedTableName: 'Cart',
        nestedId: cartId,
        data: cartModel.toJson());
  }

  void updateOrder(String orderId) {
    CrudFirebase().upDateData(
      tableName: 'Orders',
      id: orderId,
      data: {'Status': 2},
    );
  }

  void updateOrderPrice(String orderId, num totalPrice) {
    CrudFirebase().upDateData(
      tableName: 'Orders',
      id: orderId,
      data: {'TotalPrice': totalPrice},
    );
  }
}
