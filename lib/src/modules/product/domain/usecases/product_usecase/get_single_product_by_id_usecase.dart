import '../../entities/product_entity.dart';
import '../../repositories/product_repository.dart';

abstract class IGetSingleProductByIdUseCase {
  Future<ProductEntity> call(int id);
}

class GetSingleProductByIdUseCaseImp implements IGetSingleProductByIdUseCase {
  GetSingleProductByIdUseCaseImp({
    required this.repository,
  });

  final IProductRepository repository;

  @override
  Future<ProductEntity> call(int id) {
    return repository.getSingleProductById(id);
  }
}