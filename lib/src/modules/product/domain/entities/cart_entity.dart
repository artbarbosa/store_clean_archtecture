import '../../../../core/modules/user/domain/entities/user_entity.dart';
import 'product_entity.dart';

class CartEntity {
  final int id;
  final UserEntity userId;
  final List<ProductEntity> products;

  CartEntity({
    required this.id,
    required this.userId,
    required this.products,
  });
}
