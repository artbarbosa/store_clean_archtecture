import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:store_clean_archtecture/src/core/modules/product/domain/usecases/get_all_categorys_usecase.dart';
import 'package:store_clean_archtecture/src/core/modules/product/domain/value_objects/category.dart';

import '../../../../../../mocks/mock.dart';

void main() {
  late ProductRepositoryMock repository;
  late GetAllCategorysUseCaseImp usecase;

  setUpAll(() {
    repository = ProductRepositoryMock();
    usecase = GetAllCategorysUseCaseImp(repository);
  });

  test('Should return List Category', () async {
    when(() => repository.getAllCategorys())
        .thenAnswer((_) async => [category]);

    final result = await usecase.call();

    expect(result, isA<List<Category>>());
    expect(result.first.name, "men's clothing");
  });
}
