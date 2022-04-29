import '../../../../core/modules/product/domain/entities/product_entity.dart';
import '../../../../core/modules/user/domain/entities/user_entity.dart';

class CartEntity {
  final int id;
  final UserEntity user;
  final List<ProductEntity> products;

  CartEntity({
    required this.id,
    required this.user,
    required this.products,
  });
}
