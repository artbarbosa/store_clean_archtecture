import 'package:flutter/material.dart';

import '../../../../../core/modules/product/domain/usecases/get_single_product_by_id_usecase.dart';
import '../../../../../core/modules/product/infra/model/product_model.dart';
import '../states/detail_states.dart';

class DetailProductController extends ValueNotifier<DetailProductState> {
  final IGetSingleProductByIdUseCase _getSingleProductByIdUseCase;

  DetailProductController(
    this._getSingleProductByIdUseCase,
  ) : super(DetailProductLoadingState());

  Future<void> getProductById(String id) async {
    value = DetailProductLoadingState();
    try {
      final product =
          await _getSingleProductByIdUseCase.call(id) as ProductModel;
      value = DetailProductLoadedState(product: product);
    } catch (e) {
      value = DetailProductErrorState(errorMessage: e.toString());
    }
  }

  Future<void> addProductToCart() async {}
}
