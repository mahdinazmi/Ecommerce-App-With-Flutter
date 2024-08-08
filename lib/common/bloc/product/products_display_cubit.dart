import 'package:ecommerce/core/usecase/usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'products_display_state.dart';

class ProductsDisplayCubit extends Cubit<ProductsDisplayState> {
  final UseCase useCase;
  ProductsDisplayCubit({required this.useCase}) : super(ProductsLoading());
  
  void displayProducts({dynamic params}) async {
    print(params);
    var returnedData = await useCase.call(
      params: params
    );
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