import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class PaymentModel {
  String? id;
  int? type;
  DateTime? createdDate;
  String? title;
  String? link;
  String? logo;

  PaymentModel(
      {this.id, this.type, this.createdDate, this.title, this.link, this.logo});

  PaymentModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['Type'];
    createdDate = (json['CreatedDate'] as Timestamp).toDate();
    title = json['Title'];
    link = json['Link'];
    logo = json['Logo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['Type'] = type;
    data['CreatedDate'] = createdDate;
    data['Title'] = title;
    data['Link'] = link;
    data['Logo'] = logo;
    return data;
  }

  static Map<String, dynamic> toMap(PaymentModel payment) => {
        'id': payment.id,
        'Type': payment.type,
        'CreatedDate': payment.createdDate,
        'Title': payment.title,
        'Link': payment.link,
        'Logo': payment.logo,
      };
  static String encode(List<PaymentModel> payment) => json.encode(
        payment
            .map<Map<String, dynamic>>((payment) => PaymentModel.toMap(payment))
            .toList(),
      );

  static List<PaymentModel> decode(String musics) =>
      (json.decode(musics) as List<dynamic>)
          .map<PaymentModel>((item) => PaymentModel.fromJson(item))
          .toList();
}
