import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class BillModel {
  String? id;
  String? addressID;
  num? billPrice;
  DateTime? createdDate;
  num? deliveryPrice;
  num? discount;
  String? orderID;
  num? status;
  num? taxFees;
  num? totalPrice;
  String? transID;
  String? userID;

  static String tableName = 'Bills';

  BillModel({
    this.id,
    this.addressID,
    this.billPrice,
    this.createdDate,
    this.deliveryPrice,
    this.discount,
    this.orderID,
    this.status,
    this.taxFees,
    this.totalPrice,
    this.transID,
    this.userID,
  });

  BillModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    addressID = json['AddressID'];
    billPrice = json['BillPrice'];
    createdDate = (json['CreatedDate'] as Timestamp).toDate();
    deliveryPrice = json['DeliveryPrice'];
    discount = json['Discount'];
    orderID = json['OrderID'];
    status = json['Status'];
    taxFees = json['TaxFees'];
    totalPrice = json['TotalPrice'];
    transID = json['TransID'];
    userID = json['UserID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['AddressID'] = addressID;
    data['BillPrice'] = billPrice;
    data['CreatedDate'] = createdDate;
    data['DeliveryPrice'] = deliveryPrice;
    data['Discount'] = discount;
    data['OrderID'] = orderID;
    data['Status'] = status;
    data['TaxFees'] = taxFees;
    data['TotalPrice'] = totalPrice;
    data['TransID'] = transID;
    data['UserID'] = userID;
    return data;
  }

  static Map<String, dynamic> toMap(BillModel bill) => {
        'id': bill.id,
        'AddressID': bill.addressID,
        'BillPrice': bill.billPrice,
        'CreatedDate': bill.createdDate,
        'DeliveryPrice': bill.deliveryPrice,
        'Discount': bill.discount,
        'OrderID': bill.orderID,
        'Status': bill.status,
        'TaxFees': bill.taxFees,
        'TotalPrice': bill.totalPrice,
        'TransID': bill.transID,
        'UserID': bill.userID,
      };
  static String encode(List<BillModel> bill) => json.encode(
        bill
            .map<Map<String, dynamic>>((bill) => BillModel.toMap(bill))
            .toList(),
      );

  static List<BillModel> decode(String musics) =>
      (json.decode(musics) as List<dynamic>)
          .map<BillModel>((item) => BillModel.fromJson(item))
          .toList();
}
