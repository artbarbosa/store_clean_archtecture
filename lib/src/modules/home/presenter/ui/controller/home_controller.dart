import 'package:flutter/material.dart';

import '../../../../../core/modules/product/domain/usecases/get_all_categorys_usecase.dart';
import '../../../../../core/modules/product/domain/usecases/get_all_products_usecase.dart';
import '../../../../../core/modules/product/domain/usecases/get_products_by_specific_category_usecase.dart';
import '../../../../../core/modules/product/domain/value_objects/category.dart';
import '../../../../../core/modules/product/infra/model/product_model.dart';
import '../states/home_state.dart';

class HomeController extends ValueNotifier<HomeState> {
  final IGetAllProductsUseCase getAllProductsUseCase;
  final IGetAllCategorysUseCase getAllCategorysUseCase;
  final IGetProductsBySpecificCategoryUseCase getProductsByCategoryUseCase;

  HomeController({
    required this.getAllProductsUseCase,
    required this.getAllCategorysUseCase,
    required this.getProductsByCategoryUseCase,
  }) : super(HomeLoadingState());

  late List<ProductModel> listProducts;
  late List<Category> listCategory;

  Future<void> _getAllProducts() async {
    listProducts = await getAllProductsUseCase.call() as List<ProductModel>;
    notifyListeners();
  }

  Future<void> _getAllCategorys() async {
    listCategory = await getAllCategorysUseCase.call();
  }

  Future<void> _getProductsByCategory(Category category) async {
    listProducts =
        await getProductsByCategoryUseCase.call(category) as List<ProductModel>;
    notifyListeners();
  }

  Future<void> searchProduct(String search) async {}

  Future<void> fetchProducts() async {
    value = HomeLoadingState();
    try {
      await _getAllProducts();
      await _getAllCategorys();
      value = HomeLoadedState(
        listProducts: listProducts,
        listCategory: listCategory,
      );
    } catch (e) {
      value = HomeErrorState(errorMessage: e.toString());
    }
  }
}
