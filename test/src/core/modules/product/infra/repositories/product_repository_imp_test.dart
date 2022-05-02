import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:store_clean_archtecture/src/core/modules/product/domain/entities/product_entity.dart';
import 'package:store_clean_archtecture/src/core/modules/product/domain/value_objects/category.dart';
import 'package:store_clean_archtecture/src/core/modules/product/infra/datasource/product_datasource.dart';
import 'package:store_clean_archtecture/src/core/modules/product/infra/repositories/product_repository_imp.dart';

import '../../../../../../mocks/mock.dart';

void main() {
  late IProductDataSoucer datasoucer;
  late ProductRepositoryImp repository;
  final category = Category(name: 'teste');

  setUpAll(() {
    datasoucer = IProductDataSoucerMock();
    repository = ProductRepositoryImp(datasource: datasoucer);
  });

  group('Product Repository - getAllProducts', () {
    test('Should return List ProductEntity', () async {
      when(() => datasoucer.getAllProducts())
          .thenAnswer((_) async => [productMap]);

      final result = await repository.getAllProducts();

      expect(result, isA<List<ProductEntity>>());
    });
  });

  group('Product Repository - getProductsBySpecificCategory', () {
    test('Should return List ProductEntity', () async {
      when(() => datasoucer.getProductsBySpecificCategory('teste'))
          .thenAnswer((_) async => [productMap]);

      final result = await repository.getProductsBySpecificCategory(category);

      expect(result, isA<List<ProductEntity>>());
    });
  });

  group('Product Repository - getSingleProductById', () {
    test('Should return ProductEntity', () async {
      when(() => datasoucer.getSingleProductById(1))
          .thenAnswer((_) async => productMap);

      final result = await repository.getSingleProductById(1);

      expect(result, isA<ProductEntity>());
    });
  });

  group('Product Repository - getAllCategorys', () {
    test('Should return ProductEntity', () async {
      when(() => datasoucer.getAllCategorys())
          .thenAnswer((_) async => listCategorys);

      final result = await repository.getAllCategorys();

      expect(result, isA<List<Category>>());
    });
  });
}
