abstract class IProductDataSource {
  Future<List<dynamic>> getAllProducts();
  Future<dynamic> getSingleProductById(String id);
  Future<List<dynamic>> getProductsBySpecificCategory(String name);
  Future<List<dynamic>> getAllCategorys();
}
