import '../entities/product_entity.dart';

abstract class ICartRepository {
  Future<List<ProductEntity>> getCart(int id);
  Future<void> addProductToCart();
  Future<void> deleteProductToCart();
}
