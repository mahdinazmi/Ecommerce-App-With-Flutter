import 'package:dartz/dartz.dart';

abstract class ProductFirebaseService {
  Future<Either> getTopSelling();
}

class ProdcutFirebaseServiceImpl extends ProductFirebaseService {


  @override
  Future<Either> getTopSelling() {
    
    throw UnimplementedError();
  }

  
}