import '../../repositories/cart_repository.dart';

abstract class DeleteProductToCartUseCase {
  Future<void> call();
}

class DeleteProductToCartUseCaseImp implements DeleteProductToCartUseCase {
  final ICartRepository repository;

  DeleteProductToCartUseCaseImp(this.repository);

  @override
  Future<void> call() async {
    return repository.deleteProductToCart();
  }
}
