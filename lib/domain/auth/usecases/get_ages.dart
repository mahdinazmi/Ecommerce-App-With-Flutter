import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/usecase/usecase.dart';
import 'package:ecommerce/domain/auth/repository/auth.dart';
import 'package:ecommerce/service_locator.dart';

class GetAgesUseCase implements UseCase<Either,dynamic> {


  @override
  Future<Either> call({dynamic params}) async {
    return await sl<AuthRepository>().getAges();
  }

  
}