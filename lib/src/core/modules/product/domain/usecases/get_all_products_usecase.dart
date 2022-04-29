import '../entities/product_entity.dart';
import '../repositories/product_repository.dart';

abstract class IGetAllProductsUseCase {
  Future<List<ProductEntity>> call();
}

class GetAllProductsUseCaseImp implements IGetAllProductsUseCase {
  final IProductRepository _repository;

  GetAllProductsUseCaseImp(this._repository);

  @override
  Future<List<ProductEntity>> call() {
    return _repository.getAllProducts();
  }
}
