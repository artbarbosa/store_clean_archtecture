import '../entities/product_entity.dart';
import '../value_objects/category.dart';

abstract class IProductRepository {
  Future<List<ProductEntity>> getAllProducts();
  Future<ProductEntity> getSingleProductById(int id);
  Future<List<ProductEntity>> getProductsBySpecificCategory(Category category);
}
