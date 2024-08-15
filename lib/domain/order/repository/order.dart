import 'package:dartz/dartz.dart';
import 'package:ecommerce/data/order/models/add_to_cart_req.dart';

abstract class OrderRepository {

  Future<Either> addToCart(AddToCartReq addToCartReq);
  Future<Either> getCartProducts();
  Future<Either> removeCartProduct(String id);
}