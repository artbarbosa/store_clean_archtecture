import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:store_clean_archtecture/src/modules/product/domain/entities/product_entity.dart';
import 'package:store_clean_archtecture/src/modules/product/domain/usecases/product_usecase/get_products_by_specific_category_usecase.dart';
import 'package:store_clean_archtecture/src/modules/product/domain/value_objects/category.dart';

import '../../../../../../mocks/mock.dart';

void main() {
  late ProductRepositoryMock repository;
  late GetProductsBySpecificCategoryUseCaseImp usecase;
  final entity = ProductEntityMock();
  final category = Category(name: 'name');

  setUpAll(() {
    repository = ProductRepositoryMock();
    usecase = GetProductsBySpecificCategoryUseCaseImp(repository: repository);
  });

  test('Should return List ProductEntity', () async {
    when(() => repository.getProductsBySpecificCategory(category))
        .thenAnswer((_) async => [entity]);

    final result = await usecase.call(category);

    expect(result, isA<List<ProductEntity>>());
  });
}
