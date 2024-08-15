import 'package:ecommerce/domain/order/entities/product_ordered.dart';

abstract class CartProductsDisplayState {}

class CartProductsLoading extends CartProductsDisplayState {}

class CartProductsLoaded extends CartProductsDisplayState {
  final List<ProductOrderedEntity> products;
  CartProductsLoaded({required this.products});
}

class LoadCartProductsFailure extends CartProductsDisplayState {
  final String errorMessage;

  LoadCartProductsFailure({required this.errorMessage});
}