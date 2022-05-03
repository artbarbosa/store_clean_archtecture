import '../../../../../core/modules/product/infra/model/product_model.dart';

abstract class HomeState {}

class HomeLoadingState implements HomeState {}

class HomeLoadedState implements HomeState {
  List<ProductModel> listProducts;

  HomeLoadedState({
    required this.listProducts,
  });
}

class HomeErrorState implements HomeState {
  final String errorMessage;

  HomeErrorState({required this.errorMessage});
}
