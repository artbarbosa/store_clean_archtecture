import '../../../../core/modules/product/domain/entities/product_entity.dart';
import '../../../../core/modules/user/domain/entities/user_entity.dart';
import '../entities/cart_entity.dart';

abstract class ICartRepository {
  Future<CartEntity> getCart(UserEntity user);
  Future<bool> addProductToCart(ProductEntity id);
  Future<bool> deleteProductToCart(ProductEntity id);
}
