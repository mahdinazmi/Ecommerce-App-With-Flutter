import 'package:ecommerce/domain/order/entities/order.dart';

abstract class OrdersDisplayState {}

class OrdersLoading extends OrdersDisplayState {}

class OrdersLoaded extends OrdersDisplayState {
  final List<OrderEntity> orders;
  OrdersLoaded({required this.orders});
}

class LoadOrdersFailure extends OrdersDisplayState {
  final String errorMessage;
  LoadOrdersFailure({required this.errorMessage});
}