import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:store_clean_archtecture/src/core/modules/product/domain/errors/product_errors.dart';
import 'package:store_clean_archtecture/src/modules/cart/domain/usecases/delete_product_to_cart_usecase.dart';

import '../../../../../mocks/mock.dart';

void main() {
  late CartRepositoryMock repository;
  late DeleteProductToCartUseCaseImp usecase;

  setUpAll(() {
    repository = CartRepositoryMock();
    usecase = DeleteProductToCartUseCaseImp(repository);
  });

  test('Should return bool confirm delete product', () async {
    when(() => repository.deleteProductToCart(productEntity))
        .thenAnswer((_) async => true);

    final result = await usecase.call(productEntity);

    expect(result, true);
  });

  test('Should throw bool ProductInvalid', () async {
    when(() => repository.deleteProductToCart(productEntityInvalid))
        .thenAnswer((_) async => true);

    expect(() => usecase.call(productEntityInvalid),
        throwsA(isA<ProductInvalid>()));
  });
}
