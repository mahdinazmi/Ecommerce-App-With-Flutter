import 'package:ecommerce/domain/category/entity/category.dart';

abstract class CategoriesDisplayState {}

class CategoriesLoading extends CategoriesDisplayState {}

class CategoriesLoaded extends CategoriesDisplayState {
  final List<CategoryEntity> categories;
  CategoriesLoaded({required this.categories});
}

class LoadCategoriesFailure extends CategoriesDisplayState {}