import '../entities/product_entity.dart';
import '../value_objects/category.dart';

abstract class IProductRepository {
  Future<List<ProductEntity>> getAllProducts();
  Future<ProductEntity> getSingleProductById(String id);
  Future<List<ProductEntity>> getProductsBySpecificCategory(Category category);
  Future<List<Category>> getAllCategorys();
}
