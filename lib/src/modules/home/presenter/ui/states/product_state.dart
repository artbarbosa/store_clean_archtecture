import '../../../../../core/modules/product/infra/model/product_model.dart';

abstract class ProductState {}

class ProductLoadingState implements ProductState {}

class ProductLoadedState implements ProductState {
  List<ProductModel> listProducts;

  ProductLoadedState({
    required this.listProducts,
  });
}

class ProductErrorState implements ProductState {
  final String errorMessage;

  ProductErrorState({required this.errorMessage});
}
