import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../modules/product/domain/usecases/get_all_categorys_usecase.dart';
import '../../modules/product/domain/usecases/get_all_products_usecase.dart';
import '../../modules/product/domain/usecases/get_products_by_specific_category_usecase.dart';
import '../../modules/product/external/datasource/product_datasource_imp.dart';
import '../../modules/product/infra/datasource/product_datasource.dart';
import '../services/remote/dio_http_client_service.dart';
import '../services/remote/http_client_service.dart';

class Inject {
  static initialize() {
    GetIt getIt = GetIt.I;

    getIt.registerLazySingleton<IHttpService>(() => DioHttpServiceImp(Dio()));

    getIt.registerLazySingleton<IProductDataSource>(
        () => ProductDataSourceImp(httpClient: getIt()));

    getIt.registerLazySingleton<IGetAllProductsUseCase>(
        () => GetAllProductsUseCaseImp(getIt()));

    getIt.registerLazySingleton<IGetAllProductsUseCase>(
        () => GetAllProductsUseCaseImp(getIt()));

    getIt.registerLazySingleton<IGetProductsBySpecificCategoryUseCase>(
        () => GetProductsBySpecificCategoryUseCaseImp(getIt()));

    getIt.registerLazySingleton<IGetAllCategorysUseCase>(
        () => GetAllCategorysUseCaseImp(getIt()));
  }
}
