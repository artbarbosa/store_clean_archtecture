import 'package:flutter/material.dart';

import '../../../../../core/modules/product/domain/usecases/get_all_products_usecase.dart';
import '../../../../../core/modules/product/domain/usecases/get_products_by_specific_category_usecase.dart';
import '../../../../../core/modules/product/domain/value_objects/category.dart';
import '../../../../../core/modules/product/infra/model/product_model.dart';
import '../states/product_state.dart';

class ProductController extends ValueNotifier<ProductState> {
  final IGetAllProductsUseCase _getAllProductsUseCase;
  final IGetProductsBySpecificCategoryUseCase _getProductsByCategoryUseCase;
  final String firstAllCategory = 'All';

  ProductController(
    this._getAllProductsUseCase,
    this._getProductsByCategoryUseCase,
  ) : super(ProductLoadingState());

  List<ProductModel> _listProducts = [];

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
    value = ProductLoadingState();
    try {
      if (category.name == firstAllCategory) {
        await _getAllProducts();
      } else {
        await _getProductsByCategory(category);
      }
      value = ProductLoadedState(listProducts: _listProducts);
    } catch (e) {
      value = ProductErrorState(errorMessage: e.toString());
    }
  }
}
