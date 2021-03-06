import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:store_clean_archtecture/src/core/modules/product/domain/errors/product_errors.dart';
import 'package:store_clean_archtecture/src/modules/cart/domain/usecases/add_product_to_cart_usecase.dart';

import '../../../../../mocks/mock.dart';

void main() {
  late CartRepositoryMock repository;
  late AddProductToCartUseCaseImp usecase;

  setUpAll(() {
    repository = CartRepositoryMock();
    usecase = AddProductToCartUseCaseImp(repository);
  });

  test('Should return bool confirm add product', () async {
    when(() => repository.addProductToCart(productEntity))
        .thenAnswer((_) async => true);

    final result = await usecase.call(productEntity);

    expect(result, true);
  });

  test('Should throw bool ProductInvalid', () async {
    when(() => repository.addProductToCart(productEntityInvalid))
        .thenAnswer((_) async => true);

    expect(() => usecase.call(productEntityInvalid),
        throwsA(isA<ProductInvalid>()));
  });
}
