import 'dart:convert';
import 'package:hive/hive.dart';
part 'category_model.g.dart';

@HiveType(typeId: 6)
class CategoryModel {
  @HiveField(0)
  String? id;

  @HiveField(1)
  String? name;

  @HiveField(2)
  String? logo;

  static String tableName = 'MeelsCatigories';

  CategoryModel({this.id, this.name, this.logo});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    logo = json['logo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['logo'] = logo;
    return data;
  }

  static String encode(List<CategoryModel> category) => json.encode(
        category
            .map<Map<String, dynamic>>((category) => category.toJson())
            .toList(),
      );

  static List<CategoryModel> decode(String musics) =>
      (json.decode(musics) as List<dynamic>)
          .map<CategoryModel>((item) => CategoryModel.fromJson(item))
          .toList();
}
