import '../../../../core/modules/product/domain/entities/product_entity.dart';
import '../../../../core/modules/product/domain/errors/product_errors.dart';
import '../repositories/cart_repository.dart';

abstract class DeleteProductToCartUseCase {
  Future<bool> call(ProductEntity product);
}

class DeleteProductToCartUseCaseImp implements DeleteProductToCartUseCase {
  final ICartRepository _repository;

  DeleteProductToCartUseCaseImp(this._repository);

  @override
  Future<bool> call(ProductEntity product) async {
    if (!product.isValidProduct()) throw ProductInvalid();

    return _repository.deleteProductToCart(product);
  }
}
