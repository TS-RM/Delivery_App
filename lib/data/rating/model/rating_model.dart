import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tashil_food_app/data/auth/model/user_model.dart';

class RatingModel {
  String? id;
  String? userID;
  String? mealID;
  num? rate;
  String? title;
  DateTime? createdDate;
  DateTime? lastUpdate;
  UsersModel? userData;

  final String _tableName = 'Rating';

  String get tableNme => _tableName;

  RatingModel({
    this.id,
    this.userID,
    this.mealID,
    this.rate,
    this.title,
    this.createdDate,
    this.lastUpdate,
    this.userData,
  });

  RatingModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userID = json['userID'];
    mealID = json['mealID'];
    rate = json['rate'];
    title = json['title'];
    createdDate = (json['createdDate'] as Timestamp).toDate();
    lastUpdate = json['lastUpdate'] != null
        ? (json['lastUpdate'] as Timestamp).toDate()
        : null;
  }

  RatingModel.fromJsonNotTimeStamp(Map<String, dynamic> json) {
    id = json['id'];
    userID = json['userID'];
    mealID = json['mealID'];
    rate = json['rate'];
    title = json['title'];
    createdDate = json['createdDate'];
    lastUpdate = json['lastUpdate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userID'] = userID;
    data['mealID'] = mealID;
    data['rate'] = rate;
    data['title'] = title;
    data['createdDate'] = createdDate;
    data['lastUpdate'] = lastUpdate;
    return data;
  }
}
