import '../../entities/product_entity.dart';
import '../../repositories/product_repository.dart';
import '../../value_objects/category.dart';

abstract class IGetProductsBySpecificCategoryUseCase {
  Future<List<ProductEntity>> call(Category category);
}

class GetProductsBySpecificCategoryUseCaseImp
    implements IGetProductsBySpecificCategoryUseCase {
  GetProductsBySpecificCategoryUseCaseImp({
    required this.repository,
  });

  final IProductRepository repository;

  @override
  Future<List<ProductEntity>> call(Category category) {
    return repository.getProductsBySpecificCategory(category);
  }
}
