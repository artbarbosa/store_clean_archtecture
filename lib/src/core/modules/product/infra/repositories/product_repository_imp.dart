import '../../domain/entities/product_entity.dart';
import '../../domain/repositories/product_repository.dart';
import '../../domain/value_objects/category.dart';
import '../adapters/json_to_product.dart';
import '../datasource/product_datasource.dart';

class ProductRepositoryImp implements IProductRepository {
  final IProductDataSource datasource;

  ProductRepositoryImp({required this.datasource});

  @override
  Future<List<ProductEntity>> getAllProducts() async {
    final list = await datasource.getAllProducts();
    return list.map((e) => JsonToProduct.fromMap(e)).toList();
  }

  @override
  Future<List<ProductEntity>> getProductsBySpecificCategory(
      Category category) async {
    final list = await datasource.getProductsBySpecificCategory(category.name);
    return list.map((e) => JsonToProduct.fromMap(e)).toList();
  }

  @override
  Future<ProductEntity> getSingleProductById(int id) async {
    final result = await datasource.getSingleProductById(id);
    return JsonToProduct.fromMap(result);
  }

  @override
  Future<List<Category>> getAllCategorys() async {
    final list = await datasource.getAllCategorys();
    return list.map((e) => Category(name: e)).toList();
  }
}
