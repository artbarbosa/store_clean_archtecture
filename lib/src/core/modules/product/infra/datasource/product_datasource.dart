abstract class IProductDataSource {
  Future<List<dynamic>> getAllProducts();
  Future<dynamic> getSingleProductById(int id);
  Future<List<dynamic>> getProductsBySpecificCategory(String name);
  Future<List<dynamic>> getAllCategorys();
}
