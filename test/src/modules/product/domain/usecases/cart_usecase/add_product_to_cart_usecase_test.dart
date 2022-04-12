import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:store_clean_archtecture/src/modules/product/domain/usecases/cart_usecase/add_product_to_cart_usecase.dart';

import '../../../../../../mocks/mock.dart';

void main() {
  late CartRepositoryMock repository;
  late AddProductToCartUseCaseImp usecase;

  setUpAll(() {
    repository = CartRepositoryMock();
    usecase = AddProductToCartUseCaseImp(repository: repository);
  });

  test('Should return List ProductEntity', () async {
    usecase.call();
    verify(() => usecase.call()).called(1);
  });
}
