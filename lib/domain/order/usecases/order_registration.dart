import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/usecase/usecase.dart';
import 'package:ecommerce/data/order/models/order_registration_req.dart';
import 'package:ecommerce/domain/order/repository/order.dart';
import 'package:ecommerce/service_locator.dart';

class OrderRegistrationUseCase implements UseCase<Either,OrderRegistrationReq> {
  @override
  Future<Either> call({OrderRegistrationReq ? params}) async {
    return sl<OrderRepository>().orderRegistration(params!);
  }

}