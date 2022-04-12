import '../../entities/product_entity.dart';
import '../../repositories/product_repository.dart';

abstract class IGetAllProductsUseCase {
  Future<List<ProductEntity>> call();
}

class GetAllProductsUseCaseImp implements IGetAllProductsUseCase {
  GetAllProductsUseCaseImp({
    required this.repository,
  });

  final IProductRepository repository;

  @override
  Future<List<ProductEntity>> call() {
    return repository.getAllProducts();
  }
}
