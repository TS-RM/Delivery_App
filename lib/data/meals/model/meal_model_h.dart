import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class MealModelH {
  String? id;

  String? name;

  String? description;

  String? image;

  num? rating;

  int? price;

  int? calories;

  int? status;

  DateTime? addedDate;

  String? userId;

  String? option;

  String? category;

  final String _tableName = 'Meals';

  String get tableName => _tableName;

  MealModelH({
    this.id,
    this.name,
    this.image,
    this.rating,
    this.price,
    this.calories,
    this.description,
    this.addedDate,
    this.option,
    this.status,
    this.userId,
    this.category,
  });

  MealModelH.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    addedDate = (json['addedDate'] as Timestamp).toDate();
    calories = json['calories'];
    image = json['image'];
    price = json['price'];
    rating = json['rating'];
    status = json['status'];
    option = json['option'];
    userId = json['whoAdded'];
    category = json['category'];
  }
  MealModelH.fromJsonDateTime(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    addedDate = DateTime.parse(json['addedDate']);
    calories = json['calories'];
    image = json['image'];
    price = json['price'];
    rating = json['rating'];
    status = json['status'];
    option = json['option'];
    userId = json['whoAdded'];
    category = json['category'];
  }

  static MealModelH fromJsonData(Map<String, dynamic> json) => MealModelH(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        addedDate: (json['addedDate'] as Timestamp).toDate(),
        calories: json['calories'],
        image: json['image'],
        price: json['price'],
        rating: json['rating'],
        status: json['status'],
        option: json['option'],
        userId: json['whoAdded'],
        category: json['category'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['addedDate'] = addedDate;
    data['calories'] = calories;
    data['image'] = image;
    data['rating'] = rating;
    data['price'] = price;
    data['status'] = status;
    data['option'] = option;
    data['whoAdded'] = userId;
    data['category'] = category;

    return data;
  }

  Map<String, dynamic> toJsonDateTime() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['addedDate'] = addedDate!.toIso8601String();
    data['calories'] = calories;
    data['image'] = image;
    data['rating'] = rating;
    data['price'] = price;
    data['status'] = status;
    data['option'] = option;
    data['whoAdded'] = userId;
    data['category'] = category;

    return data;
  }

  Map<String, dynamic> toJsonData() => {
        'id': id,
        'name': name,
        'description': description,
        'addedDate': addedDate,
        'calories': calories,
        'image': image,
        'rating': rating,
        'price': price,
        'status': status,
        'option': option,
        'whoAdded': userId,
        'category': category,
      };

  static Map<String, dynamic> toMap(MealModelH mealModel) => {
        'id': mealModel.id,
        'name': mealModel.name,
        'description': mealModel.description,
        'addedDate': mealModel.addedDate,
        'calories': mealModel.calories,
        'image': mealModel.image,
        'rating': mealModel.rating,
        'price': mealModel.price,
        'status': mealModel.status,
        'option': mealModel.option,
        'whoAdded': mealModel.userId,
        'category': mealModel.category
      };
  static String encode(List<MealModelH> meal) => json.encode(
        meal
            .map<Map<String, dynamic>>((meal) => meal.toJsonDateTime())
            .toList(),
      );

  static List<MealModelH> decode(String musics) =>
      (json.decode(musics) as List<dynamic>)
          .map<MealModelH>((item) => MealModelH.fromJsonDateTime(item))
          .toList();
}
