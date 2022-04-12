import 'package:store_clean_archtecture/src/modules/product/domain/repositories/cart_repository.dart';

abstract class AddProductToCartUseCase {
  Future<void> call();
}

class AddProductToCartUseCaseImp implements AddProductToCartUseCase {
  final ICartRepository repository;

  AddProductToCartUseCaseImp({required this.repository});

  @override
  Future<void> call() async {
    return repository.addProductToCart();
  }
}
