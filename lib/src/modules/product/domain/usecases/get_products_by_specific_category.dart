import 'package:store_clean_archtecture/src/modules/product/domain/value_objects/category.dart';

import '../entities/product_entity.dart';
import '../repositories/product_repository.dart';

abstract class IGetProductsBySpecificCategory {
  Future<List<ProductEntity>> call(Category category);
}

class GetProductsBySpecificCategoryImp
    implements IGetProductsBySpecificCategory {
  GetProductsBySpecificCategoryImp({
    required this.repository,
  });

  final IProductRepository repository;

  @override
  Future<List<ProductEntity>> call(Category category) {
    return repository.getProductsBySpecificCategory(category);
  }
}
