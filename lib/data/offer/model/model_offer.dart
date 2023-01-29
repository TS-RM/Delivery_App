import 'package:cloud_firestore/cloud_firestore.dart';

class OfferModel {
  String? id;
  String? title;
  String? image;
  // int? mealID;
  num? discountPercent;
  num? priceAfterDiscount;
  DateTime? deadline;
  // MealModel? dataMeals;

  OfferModel({
    this.id,
    this.title,
    // this.mealID,
    this.discountPercent,
    this.priceAfterDiscount,
    this.deadline,
    // this.dataMeals,
  });

  OfferModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    // mealID = json['product_id'];
    discountPercent = json['discountPercent'];
    priceAfterDiscount = json['priceAfterDiscount'];
    deadline = (json['deadline'] as Timestamp).toDate();
    // dataMeals = json['meal'] != null ? MealModel.fromJson(json['meal']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['image'] = image;
    // data['productId'] = mealID;
    data['discountPercent'] = discountPercent;
    data['priceAfterDiscount'] = priceAfterDiscount;
    data['deadline'] = deadline;
    // if (dataMeals != null) {
    //   data['meal'] = dataMeals!.toJson();
    // }
    return data;
  }
}
