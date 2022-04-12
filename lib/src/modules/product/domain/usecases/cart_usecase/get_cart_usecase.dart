import '../../entities/product_entity.dart';
import '../../repositories/cart_repository.dart';

abstract class GetCartUseCase {
  Future<List<ProductEntity>> call(int id);
}

class GetCartUseCaseImp implements GetCartUseCase {
  final ICartRepository repository;

  GetCartUseCaseImp(this.repository);

  @override
  Future<List<ProductEntity>> call(int id) async {
    return repository.getCart(id);
  }
}
