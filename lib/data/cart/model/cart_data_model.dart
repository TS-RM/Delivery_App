import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:tashil_food_app/data/cart/model/cart_model.dart';

part 'cart_data_model.g.dart';

@HiveType(typeId: 1)
class CartDataModel extends HiveObject {
  @HiveField(0)
  String? orderId;

  @HiveField(1)
  num? priceOrder;

  @HiveField(2)
  List<CartModel>? cartData;

  CartDataModel({
    this.orderId,
    this.priceOrder,
    this.cartData,
  });

  CartDataModel.fromJson(Map<String, dynamic> json) {
    orderId = json['id'];
    priceOrder = json['TotalPrice'];
    if (json['CartModel'] != null) {
      cartData = <CartModel>[] as HiveList<CartModel>?;
      json['CartModel'].forEach((v) {
        cartData!.add(CartModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = orderId;
    data['TotalPrice'] = priceOrder;
    if (cartData != null) {
      data['CartModel'] = cartData!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  static Map<String, dynamic> toMap(CartDataModel cart) => {
        'idOrder': cart.orderId,
        'TotalPrice': cart.priceOrder,
        'CartModel': cart.cartData,
      };

  static String encode(CartDataModel cart) => json.encode(cart.toJson());

  static CartDataModel decode(String musics) {
    final data = (json.decode(musics) as Map<String, dynamic>);
    final cartDataModel = CartDataModel.fromJson(data);
    return cartDataModel;
  }
}
