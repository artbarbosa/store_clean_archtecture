import '../entities/product_entity.dart';
import '../repositories/product_repository.dart';

abstract class IGetAllProducts {
  Future<List<ProductEntity>> call();
}

class GetAllProductsImp implements IGetAllProducts {
  GetAllProductsImp({
    required this.repository,
  });

  final IProductRepository repository;

  @override
  Future<List<ProductEntity>> call() {
    return repository.getAllProducts();
  }
}
