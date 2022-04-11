import '../entities/product_entity.dart';
import '../repositories/product_repository.dart';

abstract class IGetSingleProductById {
  Future<ProductEntity> call(int id);
}

class GetSingleProductByIdImp implements IGetSingleProductById {
  GetSingleProductByIdImp({
    required this.repository,
  });

  final IProductRepository repository;

  @override
  Future<ProductEntity> call(int id) {
    return repository.getSingleProductById(id);
  }
}
