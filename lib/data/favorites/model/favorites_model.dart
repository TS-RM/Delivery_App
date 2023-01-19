import 'dart:convert';

class FavoritesModel {
  int? id;
  String? name;
  String? image;
  int? rating;
  int? price;
  int? calories;
  String? description;

  FavoritesModel({
    this.id,
    this.name,
    this.image,
    this.rating,
    this.price,
    this.calories,
    this.description,
  });

  FavoritesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    rating = json['rating'];
    price = json['price'];
    calories = json['calories'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['rating'] = rating;
    data['price'] = price;
    data['calories'] = calories;
    data['description'] = description;
    return data;
  }

  static Map<String, dynamic> toMap(FavoritesModel favoritesData) => {
        'id': favoritesData.id,
        'image': favoritesData.image,
        'rating': favoritesData.rating,
        'price': favoritesData.price,
        'name': favoritesData.name,
        'calories': favoritesData.calories,
        'description': favoritesData.description,
      };
  static String encode(List<FavoritesModel> musics) => json.encode(
        musics
            .map<Map<String, dynamic>>((music) => FavoritesModel.toMap(music))
            .toList(),
      );

  static List<FavoritesModel> decode(String musics) =>
      (json.decode(musics) as List<dynamic>)
          .map<FavoritesModel>((item) => FavoritesModel.fromJson(item))
          .toList();
}
