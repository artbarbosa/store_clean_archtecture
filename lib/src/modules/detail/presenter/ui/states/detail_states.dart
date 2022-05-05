import '../../../../../core/modules/product/infra/model/product_model.dart';

abstract class DetailProductState {}

class DetailProductLoadingState implements DetailProductState {}

class DetailProductLoadedState implements DetailProductState {
  final ProductModel product;

  DetailProductLoadedState({
    required this.product,
  });
}

class DetailProductErrorState implements DetailProductState {
  final String errorMessage;

  DetailProductErrorState({required this.errorMessage});
}
