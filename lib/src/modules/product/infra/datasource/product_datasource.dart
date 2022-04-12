abstract class IProductDataSoucer {
  Future<List<Map>> getAllProducts();
  Future<Map> getSingleProductById(int id);
  Future<List<Map>> getProductsBySpecificCategory(String name);
}
