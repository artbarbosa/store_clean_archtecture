import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../../../core/modules/product/domain/usecases/get_all_categorys_usecase.dart';
import '../../../../../core/modules/product/domain/usecases/get_all_products_usecase.dart';
import '../../../../../core/modules/product/domain/usecases/get_products_by_specific_category_usecase.dart';
import '../../../../../core/modules/product/external/datasource/product_datasource_imp.dart';
import '../../../../../core/modules/product/infra/repositories/product_repository_imp.dart';
import '../../../../../core/shared/services/remote/dio_http_client_service.dart';
import '../controller/home_controller.dart';
import '../home_error.dart';
import '../home_loading.dart';
import '../home_page.dart';
import '../states/home_state.dart';

class HomeContainer extends StatefulWidget {
  const HomeContainer({Key? key}) : super(key: key);

  @override
  State<HomeContainer> createState() => _HomeContainerState();
}

class _HomeContainerState extends State<HomeContainer> {
  final controller = HomeController(
    getAllProductsUseCase: GetAllProductsUseCaseImp(
      ProductRepositoryImp(
        datasource: ProductDataSourceImp(
          httpClient: DioHttpServiceImp(
            Dio(),
          ),
        ),
      ),
    ),
    getAllCategorysUseCase: GetAllCategorysUseCaseImp(
      ProductRepositoryImp(
        datasource: ProductDataSourceImp(
          httpClient: DioHttpServiceImp(
            Dio(),
          ),
        ),
      ),
    ),
    getProductsByCategoryUseCase: GetProductsBySpecificCategoryUseCaseImp(
      ProductRepositoryImp(
        datasource: ProductDataSourceImp(
          httpClient: DioHttpServiceImp(
            Dio(),
          ),
        ),
      ),
    ),
  );

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      controller.fetchProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ValueListenableBuilder(
        valueListenable: controller,
        builder: (context, value, child) {
          if (value is HomeLoadedState) {
            return HomePage(
              listCategory: value.listCategory,
              listProduct: value.listProducts,
            );
          }
          if (value is HomeErrorState) {
            return HomeError(
              errorMessage: value.errorMessage,
            );
          }
          return const HomeLoading();
        },
      ),
    );
  }
}
