import 'package:store_clean_archtecture/src/core/modules/user/domain/entities/user_entity.dart';

import '../../../../core/modules/product/domain/entities/product_entity.dart';

abstract class ICartRepository {
  Future<List<ProductEntity>> getCart(UserEntity user);
  Future<bool> addProductToCart(ProductEntity id);
  Future<bool> deleteProductToCart(ProductEntity id);
}
