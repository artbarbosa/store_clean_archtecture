import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:store_clean_archtecture/src/modules/product/domain/entities/product_entity.dart';
import 'package:store_clean_archtecture/src/modules/product/domain/usecases/get_all_products.dart';

import '../../../../../mocks/mock.dart';

void main() {
  late ProductRepositoryMock repository;
  late GetAllProductsImp usecase;
  final entity = ProductEntityMock();

  setUpAll(() {
    repository = ProductRepositoryMock();
    usecase = GetAllProductsImp(repository: repository);
  });

  test('Should return List ProductEntity', () async {
    when(() => repository.getAllProducts()).thenAnswer((_) async => [entity]);

    final result = await usecase.call();

    expect(result, isA<List<ProductEntity>>());
  });
}
