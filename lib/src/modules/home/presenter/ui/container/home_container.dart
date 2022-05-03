import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../../../core/modules/product/domain/usecases/get_all_categorys_usecase.dart';
import '../../../../../core/modules/product/domain/usecases/get_all_products_usecase.dart';
import '../../../../../core/modules/product/domain/usecases/get_products_by_specific_category_usecase.dart';
import '../../../../../core/modules/product/external/datasource/product_datasource_imp.dart';
import '../../../../../core/modules/product/infra/repositories/product_repository_imp.dart';
import '../../../../../core/shared/services/remote/dio_http_client_service.dart';
import '../components/category_component.dart';
import '../controller/category_controller.dart';
import '../controller/home_controller.dart';
import '../home_error.dart';
import '../home_loading.dart';
import '../home_page.dart';
import '../states/category_states.dart';
import '../states/home_state.dart';

class HomeContainer extends StatefulWidget {
  const HomeContainer({Key? key}) : super(key: key);

  @override
  State<HomeContainer> createState() => _HomeContainerState();
}

class _HomeContainerState extends State<HomeContainer> {
  final homeController = HomeController(
    GetAllProductsUseCaseImp(
      ProductRepositoryImp(
        datasource: ProductDataSourceImp(
          httpClient: DioHttpServiceImp(
            Dio(),
          ),
        ),
      ),
    ),
    GetProductsBySpecificCategoryUseCaseImp(
      ProductRepositoryImp(
        datasource: ProductDataSourceImp(
          httpClient: DioHttpServiceImp(
            Dio(),
          ),
        ),
      ),
    ),
  );

  final categoryController = CategoryController(GetAllCategorysUseCaseImp(
    ProductRepositoryImp(
      datasource: ProductDataSourceImp(
        httpClient: DioHttpServiceImp(
          Dio(),
        ),
      ),
    ),
  ));
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      categoryController.getAllCategorys();
      final firstCategory = categoryController.getFirstCategorys;
      homeController.fetchProducts(firstCategory);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: CustomScrollView(
          slivers: [
            ValueListenableBuilder(
              valueListenable: categoryController,
              builder: (context, value, child) {
                if (value is CategoryLoadedState) {
                  return CategoryComponent(
                    listCategorys: value.listCategory,
                  );
                }
                if (value is CategoryErrorState) {
                  return Container();
                }
                return Container();
              },
            ),
            ValueListenableBuilder(
              valueListenable: homeController,
              builder: (context, value, child) {
                if (value is HomeLoadedState) {
                  return HomePage(
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
          ],
        ));
  }
}
