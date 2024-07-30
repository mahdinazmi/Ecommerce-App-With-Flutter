// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import '../../../domain/category/entity/category.dart';

class CategoryModel {

  final String title;
  final String categoryId;
  final String image;

  CategoryModel({
    required this.title,
    required this.categoryId,
    required this.image
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'categoryId': categoryId,
      'image': image,
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      title: map['title'] as String,
      categoryId: map['categoryId'] as String,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromJson(String source) => CategoryModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

extension CategoryXModel on CategoryModel {
  CategoryEntity toEntity() {
    return CategoryEntity(
      categoryId: categoryId,
      image: image,
      title: title
    );
  }
}