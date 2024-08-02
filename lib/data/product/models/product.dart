// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:ecommerce/data/product/models/color.dart';

class ProductModel {
  final String categoryId;
  final List < ProductColorModel > colors;
  final Timestamp createdDate;
  final double discountedPrice;
  final int gender;
  final List < String > images;
  final double price;
  final List < String > sizes;
  final String productId;
  final int salesNumber;
  final String title;

  ProductModel({
    required this.categoryId,
    required this.colors,
    required this.createdDate,
    required this.discountedPrice,
    required this.gender,
    required this.images,
    required this.price,
    required this.sizes,
    required this.productId,
    required this.salesNumber,
    required this.title
  });

 
  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      categoryId: map['categoryId'] as String,
      colors: List<ProductColorModel>.from(
        map['colors'].map((e)=> ProductColorModel.fromMap(e))
      ),
      createdDate: map['createdDate'] as Timestamp,
      discountedPrice: map['discountedPrice'] as double,
      gender: map['gender'] as int,
      images: List < String >.from(
        map['images'].map((e) => e.toString()),
      ),
      price: map['price'] as double,
      sizes: List < String >.from(
        map['sizes'].map((e) => e.toString()),
      ),
      productId: map['productId'] as String,
      salesNumber: map['salesNumber'] as int,
      title: map['title'] as String,
    );
  }
}
