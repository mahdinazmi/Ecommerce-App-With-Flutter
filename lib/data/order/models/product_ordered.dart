// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:ecommerce/domain/order/entities/product_ordered.dart';

class ProductOrderedModel {
  final String productId;
  final String productTitle;
  final int productQuantity;
  final String productColor;
  final String productSize;
  final double productPrice;
  final double totalPrice;
  final String productImage;
  final String createdDate;
  final String id;

  ProductOrderedModel({
    required this.productId,
    required this.productTitle,
    required this.productQuantity,
    required this.productColor,
    required this.productSize,
    required this.productPrice,
    required this.totalPrice,
    required this.productImage,
    required this.createdDate,
    required this.id
  });


  factory ProductOrderedModel.fromMap(Map<String, dynamic> map) {
    return ProductOrderedModel(
      productId: map['productId'] as String,
      productTitle: map['productTitle'] as String,
      productQuantity: map['productQuantity'] as int,
      productColor: map['productColor'] as String,
      productSize: map['productSize'] as String,
      productPrice: map['productPrice'] as double,
      totalPrice: map['totalPrice'] as double,
      productImage: map['productImage'] as String,
      createdDate: map['createdDate'] as String,
      id: map['id'] as String
    );
  }

}

extension ProductOrderedXModel on ProductOrderedModel {
  ProductOrderedEntity toEntity() {
    return ProductOrderedEntity(
      productId: productId, 
      productTitle: productTitle, 
      productQuantity: productQuantity, 
      productColor: productColor, 
      productSize: productSize, 
      productPrice: productPrice, 
      totalPrice: totalPrice, 
      productImage: productImage, 
      createdDate: createdDate,
      id: id
    );
  }
}