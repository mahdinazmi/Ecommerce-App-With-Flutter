import 'package:flutter_bloc/flutter_bloc.dart';

class AgeSelectionCubit extends Cubit<String> {
  
  AgeSelectionCubit() : super ('Age Range');

  String selectedAge = '';

  void selectAge(String age) {
    selectedAge = age;
    emit(selectedAge);
  }
} 