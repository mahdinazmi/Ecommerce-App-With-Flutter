// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/domain/order/entities/order_status.dart';

class OrderStatusModel {
  final String title;
  final bool done;
  final Timestamp createdDate;

  OrderStatusModel({
    required this.title, 
    required this.done, 
    required this.createdDate
  });


  factory OrderStatusModel.fromMap(Map<String, dynamic> map) {
    return OrderStatusModel(
      title: map['title'] as String,
      done: map['done'] as bool,
      createdDate: map['createdDate'] as Timestamp
    );
  }
}

extension OrderStatusXModel on OrderStatusModel {
  OrderStatusEntity toEntity() {
    return OrderStatusEntity(
      createdDate: createdDate,
      done: done,
      title: title
    );
  }
}
