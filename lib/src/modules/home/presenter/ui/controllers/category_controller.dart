import 'package:flutter/material.dart';
import 'package:store_clean_archtecture/src/modules/home/presenter/ui/states/category_states.dart';

import '../../../../../core/modules/product/domain/usecases/get_all_categorys_usecase.dart';
import '../../../../../core/modules/product/domain/value_objects/category.dart';

class CategoryController extends ValueNotifier<CategoryState> {
  final IGetAllCategorysUseCase _getAllCategorysUseCase;
  final String _firstCategory = 'All';

  CategoryController(
    this._getAllCategorysUseCase,
  ) : super(CategoryLoadingState());

  List<Category> _listCategory = [];

  Category get getFirstCategory => _listCategory.first;

  Future<void> getAllCategorys() async {
    value = CategoryLoadingState();
    try {
      _listCategory = await _getAllCategorysUseCase.call();
      _listCategory.insert(0, Category(name: _firstCategory));
      value = CategoryLoadedState(listCategory: _listCategory);
    } catch (e) {
      value = CategoryErrorState(errorMessage: e.toString());
    }
  }
}
