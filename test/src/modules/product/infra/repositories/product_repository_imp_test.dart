import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:store_clean_archtecture/src/modules/product/domain/entities/product_entity.dart';
import 'package:store_clean_archtecture/src/modules/product/domain/value_objects/category.dart';
import 'package:store_clean_archtecture/src/modules/product/infra/datasource/product_datasource.dart';
import 'package:store_clean_archtecture/src/modules/product/infra/repositories/product_repository_imp.dart';

import '../../../../../mocks/mock.dart';

void main() {
  late IProductDataSoucer datasoucer;
  late ProductRepositoryImp repository;
  final category = Category(name: 'teste');

  setUpAll(() {
    datasoucer = IProductDataSoucerMock();
    repository = ProductRepositoryImp(datasource: datasoucer);
  });

  test('Product Repository getAllProducts', () async {
    when(() => datasoucer.getAllProducts())
        .thenAnswer((_) async => [productMap]);

    final result = await repository.getAllProducts();

    expect(result, isA<List<ProductEntity>>());
  });

  test('Product Repository getProductsBySpecificCategory', () async {
    when(() => datasoucer.getProductsBySpecificCategory('teste'))
        .thenAnswer((_) async => [productMap]);

    final result = await repository.getProductsBySpecificCategory(category);

    expect(result, isA<List<ProductEntity>>());
  });

  test('Product Repository getSingleProductById', () async {
    when(() => datasoucer.getSingleProductById(1))
        .thenAnswer((_) async => productMap);

    final result = await repository.getSingleProductById(1);

    expect(result, isA<ProductEntity>());
  });
}
