import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:store_clean_archtecture/src/modules/home/presenter/ui/controllers/category_controller.dart';
import 'package:store_clean_archtecture/src/modules/home/presenter/ui/states/category_states.dart';

import '../../../../../../mocks/mock.dart';

void main() {
  late CategoryController controller;
  late GetAllCategorysUseCaseMock getAllCategoryUseCase;
  setUpAll(() {
    getAllCategoryUseCase = GetAllCategorysUseCaseMock();
    controller = CategoryController(getAllCategoryUseCase);
  });
  group('CategoryController - getAllCategorys', () {
    test('Should fetch and change value CategoryLoadedState', () async {
      when(() => getAllCategoryUseCase.call())
          .thenAnswer((_) async => listCategory);

      await controller.getAllCategorys();
      final firstCategory = controller.getFirstCategory;

      expect(controller.value, isA<CategoryLoadedState>());
      expect(firstCategory.name, 'All');
    });

    test('Should fetch and change value  CategoryErrorState ', () async {
      when(() => getAllCategoryUseCase.call())
          .thenThrow((_) async => Exception());

      await controller.getAllCategorys();

      expect(controller.value, isA<CategoryErrorState>());
    });
  });
}
