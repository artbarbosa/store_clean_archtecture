import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:store_clean_archtecture/src/modules/home/presenter/ui/controllers/product_controller.dart';
import 'package:store_clean_archtecture/src/modules/home/presenter/ui/states/product_state.dart';

import '../../../../../../mocks/mock.dart';

void main() {
  late ProductController controller;
  late GetAllProductsUseCaseMock getAllProductsUseCase;
  late GetProductsBySpecificCategoryUseCaseMock getProductsByCategoryUseCase;
  setUpAll(() {
    getAllProductsUseCase = GetAllProductsUseCaseMock();
    getProductsByCategoryUseCase = GetProductsBySpecificCategoryUseCaseMock();
    controller =
        ProductController(getAllProductsUseCase, getProductsByCategoryUseCase);
  });
  group('Product Controller - FindProducts', () {
    test('Should fetch and change value ProductLoadedState - Category All',
        () async {
      when(() => getAllProductsUseCase.call())
          .thenAnswer((_) async => listProductModel);

      await controller.fetchProducts(firstAllCategory);

      expect(controller.value, isA<ProductLoadedState>());
    });
    test('Should fetch and change value ProductLoadedState - Category Specific',
        () async {
      when(() => getProductsByCategoryUseCase.call(category))
          .thenAnswer((_) async => listProductModel);

      await controller.fetchProducts(category);

      expect(controller.value, isA<ProductLoadedState>());
    });

    test('Should fetch and change value  ProductErrorState ', () async {
      when(() => getAllProductsUseCase.call())
          .thenThrow((_) async => Exception());

      await controller.fetchProducts(firstAllCategory);

      expect(controller.value, isA<ProductErrorState>());
    });
  });
}
