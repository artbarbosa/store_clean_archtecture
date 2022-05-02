import 'package:store_clean_archtecture/src/core/modules/product/domain/value_objects/category.dart';
import 'package:store_clean_archtecture/src/core/modules/product/infra/model/product_model.dart';

abstract class HomeState {}

class HomeLoadingState implements HomeState {}

class HomeLoadedState implements HomeState {
  List<ProductModel> listProducts;
  final List<Category> listCategory;

  HomeLoadedState({
    required this.listProducts,
    required this.listCategory,
  });
}

class HomeErrorState implements HomeState {
  final String errorMessage;

  HomeErrorState({required this.errorMessage});
}
