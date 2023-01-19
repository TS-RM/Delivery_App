// import 'package:tashil_food_app/data/auth/model/user_model.dart';

// class Data {
//   int? id;
//   int? userId;
//   int? ratingForId;
//   String? ratingForType;
//   int? rate;
//   String? feedback;
//   String? ipAddress;
//   String? createdAt;
//   String? updatedAt;
//   String? deletedAt;
//   UsersModel? user;

//   Data(
//       {this.id,
//       this.userId,
//       this.ratingForId,
//       this.ratingForType,
//       this.rate,
//       this.feedback,
//       this.ipAddress,
//       this.createdAt,
//       this.updatedAt,
//       this.deletedAt,
//       this.user});

//   Data.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     userId = json['user_id'];
//     ratingForId = json['ratingFor_id'];
//     ratingForType = json['ratingFor_type'];
//     rate = json['rate'];
//     feedback = json['feedback'];
//     ipAddress = json['ipAddress'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     deletedAt = json['deleted_at'];
//     user = json['user'] != null ? UsersModel.fromJson(json['user']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['user_id'] = userId;
//     data['ratingFor_id'] = ratingForId;
//     data['ratingFor_type'] = ratingForType;
//     data['rate'] = rate;
//     data['feedback'] = feedback;
//     data['ipAddress'] = ipAddress;
//     data['created_at'] = createdAt;
//     data['updated_at'] = updatedAt;
//     data['deleted_at'] = deletedAt;
//     if (user != null) {
//       data['user'] = user!.toJson();
//     }
//     return data;
//   }
// }
