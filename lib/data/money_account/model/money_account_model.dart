import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class MoneyAccountModel {
  String? id;
  num? reMain;
  num? spend;
  num? status;
  DateTime? createdDate;
  num? totalMoney;

  static String tableName = 'MoneyAccount';

  MoneyAccountModel({
    this.id,
    this.reMain,
    this.spend,
    this.status,
    this.createdDate,
    this.totalMoney,
  });

  MoneyAccountModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    reMain = json['Remain'];
    spend = json['Spend'];
    status = json['Status'];
    createdDate = (json['CreatedDate'] as Timestamp).toDate();
    totalMoney = json['TotalMoney'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['Remain'] = reMain;
    data['Spend'] = spend;
    data['Status'] = status;
    data['CreatedDate'] = createdDate;
    data['TotalMoney'] = totalMoney;
    return data;
  }

  static Map<String, dynamic> toMap(MoneyAccountModel moneyAccount) => {
        'id': moneyAccount.id,
        'Remain': moneyAccount.reMain,
        'Spend': moneyAccount.spend,
        'Status': moneyAccount.status,
        'CreatedDate': moneyAccount.createdDate,
        'TotalMoney': moneyAccount.totalMoney,
      };
  static String encode(List<MoneyAccountModel> moneyAccount) => json.encode(
        moneyAccount
            .map<Map<String, dynamic>>(
                (moneyAccount) => MoneyAccountModel.toMap(moneyAccount))
            .toList(),
      );

  static List<MoneyAccountModel> decode(String musics) =>
      (json.decode(musics) as List<dynamic>)
          .map<MoneyAccountModel>((item) => MoneyAccountModel.fromJson(item))
          .toList();
}
