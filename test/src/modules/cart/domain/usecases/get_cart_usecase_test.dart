import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:store_clean_archtecture/src/core/modules/user/domain/errors/user_errors.dart';
import 'package:store_clean_archtecture/src/modules/cart/domain/entities/cart_entity.dart';
import 'package:store_clean_archtecture/src/modules/cart/domain/usecases/get_cart_usecase.dart';

import '../../../../../mocks/mock.dart';

void main() {
  late CartRepositoryMock repository;
  late GetCartUseCaseImp usecase;

  setUpAll(() {
    repository = CartRepositoryMock();
    usecase = GetCartUseCaseImp(repository);
  });

  test('Should return CartEntity', () async {
    when(() => repository.getCart(userEntity))
        .thenAnswer((_) async => cartEntity);

    final result = await usecase.call(userEntity);

    expect(result, isA<CartEntity>());
  });

  test('Should throw bool ProductInvalid', () async {
    when(() => repository.getCart(userEntityInvalid))
        .thenAnswer((_) async => cartEntity);

    expect(() => usecase.call(userEntityInvalid), throwsA(isA<UserInvalid>()));
  });
}
