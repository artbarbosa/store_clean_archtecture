import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:store_clean_archtecture/src/modules/product/domain/entities/product_entity.dart';
import 'package:store_clean_archtecture/src/modules/product/domain/usecases/get_single_product_by_id.dart';

import '../../../../../mocks/mock.dart';

void main() {
  late ProductRepositoryMock repository;
  late GetSingleProductByIdImp usecase;
  final entity = ProductEntityMock();

  setUpAll(() {
    repository = ProductRepositoryMock();
    usecase = GetSingleProductByIdImp(repository: repository);
  });

  test('Should return ProductEntity', () async {
    when(() => repository.getSingleProductById(any()))
        .thenAnswer((_) async => entity);

    final result = await usecase.call(1);

    expect(result, isA<ProductEntity>());
  });
}
