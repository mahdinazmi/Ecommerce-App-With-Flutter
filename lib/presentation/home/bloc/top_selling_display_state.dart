import 'package:ecommerce/domain/product/entities/product.dart';

abstract class TopSellingDisplayState {}

class ProductsLoading extends TopSellingDisplayState {}

class ProductsLoaded extends TopSellingDisplayState {
  final List<ProductEntity> products;
  ProductsLoaded({required this.products});
}

class LoadProductsFailure extends TopSellingDisplayState {}