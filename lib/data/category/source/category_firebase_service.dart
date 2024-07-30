import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

abstract class CategoryFirebaseService {

  Future<Either> getCategories();
}

class CategoryFirebaseServiceImpl extends CategoryFirebaseService {

  
  @override
  Future < Either > getCategories() async {
    try {
      var categories = await FirebaseFirestore.instance.collection('Categories').get();
      return Right(
        categories
      );
    } catch (e) {
      return const Left(
        'Please try again'
      );
    }
  }
  
}