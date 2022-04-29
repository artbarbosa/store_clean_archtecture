import 'package:store_clean_archtecture/src/core/modules/user/domain/errors/user_errors.dart';
import 'package:store_clean_archtecture/src/modules/cart/domain/entities/cart_entity.dart';

import '../../../../core/modules/user/domain/entities/user_entity.dart';
import '../repositories/cart_repository.dart';

abstract class GetCartUseCase {
  Future<CartEntity> call(UserEntity user);
}

class GetCartUseCaseImp implements GetCartUseCase {
  final ICartRepository _repository;

  GetCartUseCaseImp(this._repository);

  @override
  Future<CartEntity> call(UserEntity user) async {
    if (!user.isValid()) throw UserInvalid();

    return _repository.getCart(user);
  }
}
