import 'package:flutter/material.dart';

import '../../../../../core/modules/product/domain/usecases/get_all_products_usecase.dart';
import '../../../../../core/modules/product/domain/usecases/get_products_by_specific_category_usecase.dart';
import '../../../../../core/modules/product/domain/value_objects/category.dart';
import '../../../../../core/modules/product/infra/model/product_model.dart';
import '../states/home_state.dart';

class HomeController extends ValueNotifier<HomeState> {
  final IGetAllProductsUseCase _getAllProductsUseCase;
  final IGetProductsBySpecificCategoryUseCase _getProductsByCategoryUseCase;

  HomeController(
    this._getAllProductsUseCase,
    this._getProductsByCategoryUseCase,
  ) : super(HomeLoadingState());

  late List<ProductModel> _listProducts = [];

  Future<void> _getAllProducts() async {
    _listProducts = await _getAllProductsUseCase.call() as List<ProductModel>;
    notifyListeners();
  }

  Future<void> _getProductsByCategory(Category category) async {
    _listProducts = await _getProductsByCategoryUseCase.call(category)
        as List<ProductModel>;
    notifyListeners();
  }

  Future<void> searchProduct(String search) async {}

  Future<void> fetchProducts(Category category) async {
    value = HomeLoadingState();
    try {
      if (category.name == 'All') {
        await _getAllProducts();
      } else {
        await _getProductsByCategory(category);
      }
      value = HomeLoadedState(
        listProducts: _listProducts,
      );
    } catch (e) {
      value = HomeErrorState(errorMessage: e.toString());
    }
  }
}
