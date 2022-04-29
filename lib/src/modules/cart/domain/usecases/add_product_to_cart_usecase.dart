import '../../../../core/modules/product/domain/entities/product_entity.dart';
import '../../../../core/modules/product/domain/errors/product_errors.dart';
import '../repositories/cart_repository.dart';

abstract class AddProductToCartUseCase {
  Future<bool> call(ProductEntity product);
}

class AddProductToCartUseCaseImp implements AddProductToCartUseCase {
  final ICartRepository _repository;

  AddProductToCartUseCaseImp(this._repository);

  @override
  Future<bool> call(ProductEntity product) async {
    if (!product.isValidProduct()) throw ProductInvalid();

    return _repository.addProductToCart(product);
  }
}
