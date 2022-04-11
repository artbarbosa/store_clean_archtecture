import 'package:store_clean_archtecture/src/modules/product/domain/value_objects/category.dart';

abstract class IProductDataSoucer {
  Future<List<Map>> getAllProducts();
  Future<Map> getSingleProductById(int id);
  Future<List<Map>> getProductsBySpecificCategory(String name);
}
