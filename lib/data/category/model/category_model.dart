import 'dart:convert';

class CategoryModel {
  String? id;
  String? name;
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
