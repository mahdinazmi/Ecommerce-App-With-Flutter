import 'package:ecommerce/domain/product/entities/color.dart';

class ProductColorModel {

  final String title;
  final String hexCode;

  ProductColorModel({
    required this.title,
    required this.hexCode
  });

  factory ProductColorModel.fromMap(Map<String, dynamic> map) {
    return ProductColorModel(
      title: map['title'] as String,
      hexCode: map['hexCode'] as String,
    );
  }
}

extension ProductColorXModel on ProductColorModel {
  ProductColorEntity toEntity() {
    return ProductColorEntity(
      title: title,
      hexCode: hexCode
    );
  }
}
