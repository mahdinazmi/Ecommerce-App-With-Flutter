// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerce/data/order/models/order_status.dart';
import 'package:ecommerce/domain/order/entities/order.dart';

import 'product_ordered.dart';

class OrderModel {
  final List < ProductOrderedModel > products;
  final String createdDate;
  final String shippingAddress;
  final int itemCount;
  final double totalPrice;
  final String code;
  final List<OrderStatusModel> orderStatus;

  OrderModel({
    required this.products, 
    required this.createdDate, 
    required this.shippingAddress, 
    required this.itemCount, 
    required this.totalPrice,
    required this.code,
    required this.orderStatus
  });
  

 
  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      products: List < ProductOrderedModel >.from(
        map['products'].map((e) => ProductOrderedModel.fromMap(e))
      ),
      createdDate: map['createdDate'] as String,
      shippingAddress: map['shippingAddress'] as String,
      itemCount: map['itemCount'] as int,
      totalPrice: map['totalPrice'] as double,
      code: map['code'] as String,
      orderStatus: List < OrderStatusModel >.from(
        map['orderStatus'].map((e) => OrderStatusModel.fromMap(e))
      ),
    );
  }

}

extension OrderXModel on OrderModel {
  OrderEntity toEntity() {
    return OrderEntity(
      products: products.map((e) => e.toEntity()).toList(), 
      createdDate: createdDate, 
      shippingAddress: shippingAddress, 
      itemCount: itemCount, 
      totalPrice: totalPrice, 
      code: code,
      orderStatus: orderStatus.map((e) => e.toEntity()).toList(),
    );
  }
}
