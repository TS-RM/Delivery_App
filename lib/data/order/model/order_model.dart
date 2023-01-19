import 'package:cloud_firestore/cloud_firestore.dart';

class OrderModel {
  String? id;
  String? userId;
  double? totalPrice;
  int? status;
  DateTime? createdDate;
  DateTime? deliverDate;

  OrderModel({
    this.id,
    this.userId,
    this.totalPrice,
    this.status,
    this.createdDate,
    this.deliverDate,
  });

  OrderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['WhoOrdered'];
    totalPrice = (json['TotalPrice'] as num).toDouble();
    status = json['Status'];
    createdDate = (json['CreatedDate'] as Timestamp).toDate();
    deliverDate = (json['DeliverDate'] as Timestamp).toDate();
  }

  OrderModel.fromJsonNotTimestamp(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['WhoOrdered'];
    totalPrice = json['TotalPrice'];
    status = json['Status'];
    createdDate = json['CreatedDate'];
    deliverDate = json['DeliverDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['WhoOrdered'] = userId;
    data['TotalPrice'] = totalPrice;
    data['Status'] = status;
    data['CreatedDate'] = createdDate;
    data['DeliverDate'] = deliverDate;
    return data;
  }
}
