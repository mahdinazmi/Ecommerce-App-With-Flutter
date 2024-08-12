import 'package:ecommerce/domain/product/entities/color.dart';

class ProductColorModel {

  final String title;
  final List<int> rgb;

  ProductColorModel({
    required this.title,
    required this.rgb,
  });

  factory ProductColorModel.fromMap(Map<String, dynamic> map) {
    return ProductColorModel(
      title: map['title'] as String,
      rgb: List < int > .from(
        map['rgb'].map((e) => e),
      ),
    );
  }
}

extension ProductColorXModel on ProductColorModel {
  ProductColorEntity toEntity() {
    return ProductColorEntity(
      title: title,
      rgb: rgb
    );
  }
}
