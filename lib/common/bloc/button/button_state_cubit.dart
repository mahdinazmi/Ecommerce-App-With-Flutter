import 'package:dartz/dartz.dart';
import 'package:ecommerce/common/bloc/button/button_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/usecase/usecase.dart';

class ButtonStateCubit extends Cubit<ButtonState> {
  ButtonStateCubit() : super(ButtonInitialState());


  Future<void> execute({dynamic params,required UseCase usecase }) async {
    emit(ButtonLoadingState());
    try {
      Either returnedData = await usecase.call(params: params);
      returnedData.fold(
        (error) {
          emit(
            ButtonFailureState(
            errorMessage: error
          )
         );
        },
        (data) {
          emit(ButtonSuccessState());
        }
      );

    } catch (e) {
      emit(
        ButtonFailureState(
          errorMessage: e.toString()
        )
      );
    }
  }
}