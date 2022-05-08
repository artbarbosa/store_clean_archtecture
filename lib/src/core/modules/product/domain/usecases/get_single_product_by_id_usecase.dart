import '../entities/product_entity.dart';
import '../repositories/product_repository.dart';

abstract class IGetSingleProductByIdUseCase {
  Future<ProductEntity> call(String id);
}

class GetSingleProductByIdUseCaseImp implements IGetSingleProductByIdUseCase {
  final IProductRepository _repository;

  GetSingleProductByIdUseCaseImp(this._repository);

  @override
  Future<ProductEntity> call(String id) {
    return _repository.getSingleProductById(id);
  }
}
