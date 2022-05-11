import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:store_clean_archtecture/src/core/modules/product/domain/repositories/product_repository.dart';
import 'package:store_clean_archtecture/src/core/modules/product/domain/usecases/get_all_categorys_usecase.dart';
import 'package:store_clean_archtecture/src/core/modules/product/domain/usecases/get_all_products_usecase.dart';
import 'package:store_clean_archtecture/src/core/modules/product/domain/usecases/get_products_by_specific_category_usecase.dart';
import 'package:store_clean_archtecture/src/core/modules/product/domain/usecases/get_single_product_by_id_usecase.dart';
import 'package:store_clean_archtecture/src/core/modules/product/external/datasource/product_datasource_imp.dart';
import 'package:store_clean_archtecture/src/core/modules/product/infra/datasource/product_datasource.dart';
import 'package:store_clean_archtecture/src/core/modules/product/infra/repositories/product_repository_imp.dart';
import 'package:store_clean_archtecture/src/core/shared/inject/inject.dart';
import 'package:store_clean_archtecture/src/core/shared/services/remote/dio_http_client_service.dart';
import 'package:store_clean_archtecture/src/core/shared/services/remote/http_client_service.dart';
import 'package:store_clean_archtecture/src/modules/detail/presenter/ui/controller/detail_controller.dart';
import 'package:store_clean_archtecture/src/modules/home/presenter/ui/controllers/category_controller.dart';
import 'package:store_clean_archtecture/src/modules/home/presenter/ui/controllers/product_controller.dart';

void main() {
  setUpAll(() async {
    await Inject.initialize();
  });
  test('Should return Instance DioHttpServiceImp', () async {
    final result = GetIt.I<IHttpService>();

    expect(result, isA<IHttpService>());
    expect(result, isA<DioHttpServiceImp>());
  });
  test('Should return Instance IProductRepository', () async {
    final result = GetIt.I<IProductRepository>();

    expect(result, isA<IProductRepository>());
    expect(result, isA<ProductRepositoryImp>());
  });
  test('Should return Instance IProductDataSource', () async {
    final result = GetIt.I<IProductDataSource>();

    expect(result, isA<IProductDataSource>());
    expect(result, isA<ProductDataSourceImp>());
  });

  test('Should return Instance IGetSingleProductByIdUseCase', () async {
    final result = GetIt.I<IGetSingleProductByIdUseCase>();

    expect(result, isA<IGetSingleProductByIdUseCase>());
    expect(result, isA<GetSingleProductByIdUseCaseImp>());
  });
  test('Should return Instance IGetSingleProductByIdUseCase', () async {
    final result = GetIt.I<IGetAllProductsUseCase>();

    expect(result, isA<IGetAllProductsUseCase>());
    expect(result, isA<GetAllProductsUseCaseImp>());
  });
  test('Should return Instance IGetProductsBySpecificCategoryUseCase',
      () async {
    final result = GetIt.I<IGetProductsBySpecificCategoryUseCase>();

    expect(result, isA<IGetProductsBySpecificCategoryUseCase>());
    expect(result, isA<GetProductsBySpecificCategoryUseCaseImp>());
  });
  test('Should return Instance IGetAllCategorysUseCase', () async {
    final result = GetIt.I<IGetAllCategorysUseCase>();

    expect(result, isA<IGetAllCategorysUseCase>());
    expect(result, isA<GetAllCategorysUseCaseImp>());
  });

  test('Should return Instance ProductController', () async {
    final result = GetIt.I<ProductController>();

    expect(result, isA<ProductController>());
  });

  test('Should return Instance CategoryController', () async {
    final result = GetIt.I<CategoryController>();

    expect(result, isA<CategoryController>());
  });
  test('Should return Instance DetailProductController', () async {
    final result = GetIt.I<DetailProductController>();

    expect(result, isA<DetailProductController>());
  });
}
