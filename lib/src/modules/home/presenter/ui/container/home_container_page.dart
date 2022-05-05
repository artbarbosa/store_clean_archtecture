import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../../core/shared/consts/app_color_const.dart';
import '../components/category/category_component.dart';
import '../components/products/product_component.dart';
import '../components/products/product_error.dart';
import '../components/products/product_loading.dart';
import '../controllers/category_controller.dart';
import '../controllers/home_controller.dart';
import '../states/category_states.dart';
import '../states/product_state.dart';

class HomeContainerPage extends StatefulWidget {
  const HomeContainerPage({Key? key}) : super(key: key);

  @override
  State<HomeContainerPage> createState() => _HomeContainerPageState();
}

class _HomeContainerPageState extends State<HomeContainerPage> {
  final homeController = GetIt.I.get<ProductController>();
  final categoryController = GetIt.I.get<CategoryController>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback(
      (timeStamp) async {
        await categoryController.getAllCategorys();
        final firstCategory = categoryController.getFirstCategorys;
        homeController.fetchProducts(firstCategory);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Search

            //CategoryList
            ValueListenableBuilder(
              valueListenable: categoryController,
              builder: (context, value, child) {
                if (value is CategoryLoadedState) {
                  return CategoryComponent(
                    listCategorys: value.listCategory,
                  );
                }
                return Container(
                  height: 25,
                );
              },
            ),

            //ProductGrid
            ValueListenableBuilder(
              valueListenable: homeController,
              builder: (context, value, child) {
                if (value is ProductLoadedState) {
                  return ProductComponent(
                    listProduct: value.listProducts,
                  );
                }
                if (value is ProductErrorState) {
                  return ProductComponentError(
                    errorMessage: value.errorMessage,
                  );
                }
                return const ProductComponentLoading();
              },
            ),
          ],
        ),
      ),
    );
  }
}
