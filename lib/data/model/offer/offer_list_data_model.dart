// import 'package:tashil_food_app/data/meals/model/meal_model.dart';

// class OfferListData {
//   int? id;
//   String? title;
//   int? productId;
//   int? discountPercent;
//   double? priceAfterDiscount;
//   String? deadline;
//   MealModel? meal;

//   OfferListData(
//       {this.id,
//       this.title,
//       this.productId,
//       this.discountPercent,
//       this.priceAfterDiscount,
//       this.deadline,
//       this.meal});

//   OfferListData.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     title = json['title'];
//     productId = json['product_id'];
//     discountPercent = json['discount_percent'];
//     priceAfterDiscount = json['price_after_Discount'];
//     deadline = json['deadline'];
//     meal = json['meal'] != null ? MealModel.fromJson(json['meal']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['title'] = title;
//     data['product_id'] = productId;
//     data['discount_percent'] = discountPercent;
//     data['price_after_Discount'] = priceAfterDiscount;
//     data['deadline'] = deadline;
//     if (meal != null) {
//       data['meal'] = meal!.toJson();
//     }
//     return data;
//   }
// }
