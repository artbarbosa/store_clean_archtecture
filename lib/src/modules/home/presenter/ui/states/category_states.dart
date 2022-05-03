import '../../../../../core/modules/product/domain/value_objects/category.dart';

abstract class CategoryState {}

class CategoryLoadingState implements CategoryState {}

class CategoryLoadedState implements CategoryState {
  final List<Category> listCategory;
  CategoryLoadedState({
    required this.listCategory,
  });
}

class CategoryErrorState implements CategoryState {
  final String errorMessage;

  CategoryErrorState({required this.errorMessage});
}
