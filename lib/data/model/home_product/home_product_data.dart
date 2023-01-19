// import 'dart:convert';

// class HomeProductData {
//   int? id;
//   String? name;
//   String? image;
//   double? rating;
//   int? price;
//   int? calories;
//   String? description;
//   int? restaurantId;
//   int? numRating;

//   HomeProductData({
//     this.id,
//     this.name,
//     this.image,
//     this.rating,
//     this.price,
//     this.calories,
//     this.description,
//     this.restaurantId,
//     this.numRating,
//   });

//   HomeProductData.fromJson(Map<String, dynamic> json) {
//     id = id;
//     name = json['Name'];
//     description = json['Description'];
//     image = json['image'];
//     rating = json['Rating'];
//     price = json['Price'];
//     calories = json['calories'];
//     // numRating = json['NumRating'];
//     // restaurantId = json['restaurant_id'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['name'] = name;
//     data['image'] = image;
//     data['rating'] = rating;
//     data['price'] = price;
//     data['calories'] = calories;
//     data['description'] = description;
//     data['NumRating'] = numRating;
//     data['restaurant_id'] = restaurantId;

//     return data;
//   }

//   static Map<String, dynamic> toMap(HomeProductData homeProductData) => {
//         'id': homeProductData.id,
//         'image': homeProductData.image!.substring(30),
//         'rating': homeProductData.rating,
//         'price': homeProductData.price,
//         'name': homeProductData.name,
//         'calories': homeProductData.calories,
//         'description': homeProductData.description,
//         'NumRating': homeProductData.numRating,
//         'restaurant_id': homeProductData.restaurantId
//       };
//   static String encode(List<HomeProductData> musics) => json.encode(
//         musics
//             .map<Map<String, dynamic>>((music) => HomeProductData.toMap(music))
//             .toList(),
//       );

//   static List<HomeProductData> decode(String musics) =>
//       (json.decode(musics) as List<dynamic>)
//           .map<HomeProductData>((item) => HomeProductData.fromJson(item))
//           .toList();
// }
