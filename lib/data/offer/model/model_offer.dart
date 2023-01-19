import 'package:tashil_food_app/data/meals/model/meal_model.dart';

class OfferModel {
  int? id;
  String? title;
  int? mealID;
  int? discountPercent;
  double? priceAfterDiscount;
  String? deadline;
  MealModel? dataMeals;

  OfferModel({
    this.id,
    this.title,
    this.mealID,
    this.discountPercent,
    this.priceAfterDiscount,
    this.deadline,
    this.dataMeals,
  });

  OfferModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    mealID = json['product_id'];
    discountPercent = json['discount_percent'];
    priceAfterDiscount = json['price_after_Discount'];
    deadline = json['deadline'];
    dataMeals = json['meal'] != null ? MealModel.fromJson(json['meal']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['productId'] = mealID;
    data['discountPercent'] = discountPercent;
    data['priceAfterDiscount'] = priceAfterDiscount;
    data['deadline'] = deadline;
    if (dataMeals != null) {
      data['meal'] = dataMeals!.toJson();
    }
    return data;
  }
}
