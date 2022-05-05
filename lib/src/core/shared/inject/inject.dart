import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:store_clean_archtecture/src/core/modules/product/domain/usecases/get_single_product_by_id_usecase.dart';

import '../../../modules/home/presenter/ui/controllers/category_controller.dart';
import '../../../modules/home/presenter/ui/controllers/home_controller.dart';
import '../../modules/product/domain/repositories/product_repository.dart';
import '../../modules/product/domain/usecases/get_all_categorys_usecase.dart';
import '../../modules/product/domain/usecases/get_all_products_usecase.dart';
import '../../modules/product/domain/usecases/get_products_by_specific_category_usecase.dart';
import '../../modules/product/external/datasource/product_datasource_imp.dart';
import '../../modules/product/infra/datasource/product_datasource.dart';
import '../../modules/product/infra/repositories/product_repository_imp.dart';
import '../services/remote/dio_http_client_service.dart';
import '../services/remote/http_client_service.dart';

class Inject {
  static initialize() {
    GetIt getIt = GetIt.I;

    getIt.registerLazySingleton<IHttpService>(() => DioHttpServiceImp(Dio()));

    getIt.registerLazySingleton<IProductRepository>(
        () => ProductRepositoryImp(datasource: getIt()));

    getIt.registerLazySingleton<IProductDataSource>(
        () => ProductDataSourceImp(httpClient: getIt()));

    getIt.registerLazySingleton<IGetSingleProductByIdUseCase>(
        () => GetSingleProductByIdUseCaseImp(getIt()));

    getIt.registerLazySingleton<IGetAllProductsUseCase>(
        () => GetAllProductsUseCaseImp(getIt()));

    getIt.registerLazySingleton<IGetProductsBySpecificCategoryUseCase>(
        () => GetProductsBySpecificCategoryUseCaseImp(getIt()));

    getIt.registerLazySingleton<IGetAllCategorysUseCase>(
        () => GetAllCategorysUseCaseImp(getIt()));

    getIt.registerFactory<ProductController>(
        () => ProductController(getIt(), getIt()));

    getIt.registerFactory<CategoryController>(
      () => CategoryController(getIt()),
    );
  }
}

// final homeController = HomeController(
//   GetAllProductsUseCaseImp(
//     ProductRepositoryImp(
//       datasource: ProductDataSourceImp(
//         httpClient: DioHttpServiceImp(
//           Dio(),
//         ),
//       ),
//     ),
//   ),
//   GetProductsBySpecificCategoryUseCaseImp(
//     ProductRepositoryImp(
//       datasource: ProductDataSourceImp(
//         httpClient: DioHttpServiceImp(
//           Dio(),
//         ),
//       ),
//     ),
//   ),
// );

// final categoryController = CategoryController(
//   GetAllCategorysUseCaseImp(
//     ProductRepositoryImp(
//       datasource: ProductDataSourceImp(
//         httpClient: DioHttpServiceImp(
//           Dio(),
//         ),
//       ),
//     ),
//   ),
// );
