import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/add_to_cart_req.dart';

abstract class OrderFirebaseService {

  Future<Either> addToCart(AddToCartReq addToCartReq);
  
}

class OrderFirebaseServiceImpl extends OrderFirebaseService {


  @override
  Future<Either> addToCart(AddToCartReq addToCartReq) async {
    try {
      var user = FirebaseAuth.instance.currentUser;
      await FirebaseFirestore.instance.collection('Users')
      .doc(user!.uid)
      .collection('Cart').add(
        addToCartReq.toMap()
      );
      return const Right(
        'Add to cart was successfully'
      );
    } catch(e){
      return const Left(
        'Please try again.'
      );
    }
  }
  
}