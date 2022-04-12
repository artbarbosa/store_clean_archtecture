import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:store_clean_archtecture/src/modules/product/domain/entities/product_entity.dart';
import 'package:store_clean_archtecture/src/modules/product/domain/usecases/product_usecase/get_all_products_usecase.dart';

import '../../../../../../mocks/mock.dart';

void main() {
  late ProductRepositoryMock repository;
  late GetAllProductsUseCaseImp usecase;
  final entity = ProductEntityMock();

  setUpAll(() {
    repository = ProductRepositoryMock();
    usecase = GetAllProductsUseCaseImp(repository: repository);
  });

  test('Should return List ProductEntity', () async {
    when(() => repository.getAllProducts()).thenAnswer((_) async => [entity]);

    final result = await usecase.call();

    expect(result, isA<List<ProductEntity>>());
  });
}
