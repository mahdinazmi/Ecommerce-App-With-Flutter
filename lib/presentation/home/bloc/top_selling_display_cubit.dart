import 'package:ecommerce/domain/product/usecases/get_top_selling.dart';
import 'package:ecommerce/presentation/home/bloc/top_selling_display_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../service_locator.dart';

class TopSellingDisplayCubit extends Cubit<TopSellingDisplayState> {
  TopSellingDisplayCubit() : super(ProductsLoading());
  
  void displayProducts() async {
    var returnedData = await sl < GetTopSellingUseCase > ().call();
    returnedData.fold(
      (error) {
        emit(
          LoadProductsFailure()
        );
      },
      (data) {
        emit(
          ProductsLoaded(products: data)
        );
      }
    );
  }

}