import '../entities/product_entity.dart';
import '../repositories/product_repository.dart';

abstract class IGetSingleProductByIdUseCase {
  Future<ProductEntity> call(int id);
}

class GetSingleProductByIdUseCaseImp implements IGetSingleProductByIdUseCase {
  final IProductRepository _repository;

  GetSingleProductByIdUseCaseImp(this._repository);

  @override
  Future<ProductEntity> call(int id) {
    return _repository.getSingleProductById(id);
  }
}
