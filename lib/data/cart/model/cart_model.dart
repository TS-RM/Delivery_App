import 'dart:convert';
import 'package:hive/hive.dart';
part 'cart_model.g.dart';

@HiveType(typeId: 2)
class CartModel extends HiveObject {
  @HiveField(0)
  String? id;

  @HiveField(1)
  String? mealId;

  @HiveField(2)
  String? name;

  @HiveField(3)
  String? image;

  @HiveField(4)
  num? unitPrice;

  @HiveField(5)
  num? quantity;

  @HiveField(6)
  num? totalPrice;

  CartModel({
    this.id,
    this.mealId,
    this.unitPrice,
    this.quantity,
    this.totalPrice,
    this.name,
    this.image,
  });

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mealId = json['MealID'];
    name = json['Name'];
    image = json['Image'];
    unitPrice = json['PeicePrice'];
    quantity = json['Amount'];
    totalPrice = json['MealTotlePrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['MealID'] = mealId;
    data['Image'] = image;
    data['Name'] = name;
    data['PeicePrice'] = unitPrice;
    data['Amount'] = quantity;
    data['MealTotlePrice'] = totalPrice;
    return data;
  }

  static Map<String, dynamic> toMap(CartModel cart) => {
        'id': cart.id,
        'MealID': cart.mealId,
        'PeicePrice': cart.unitPrice,
        'Amount': cart.quantity,
        'MealTotlePrice': cart.totalPrice,
      };
  static String encode(List<CartModel> cart) => json.encode(
        cart
            .map<Map<String, dynamic>>((cart) => CartModel.toMap(cart))
            .toList(),
      );

  static List<CartModel> decode(String musics) =>
      (json.decode(musics) as List<dynamic>)
          .map<CartModel>((item) => CartModel.fromJson(item))
          .toList();
}
