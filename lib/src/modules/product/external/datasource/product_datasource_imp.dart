import 'package:store_clean_archtecture/src/core/services/remote/http_client_service.dart';
import 'package:store_clean_archtecture/src/modules/product/infra/datasource/product_datasource.dart';

import '../../../../core/consts/api_consts.dart';

class ProductDataSourceImp extends IProductDataSoucer {
  final IHttpService httpClient;

  ProductDataSourceImp({required this.httpClient});

  @override
  Future<List<Map>> getAllProducts() async {
    final response = await httpClient.get(ApiConst.allProductsURL());
    final list = response.data as List<Map<String, dynamic>>;
    return list;
  }

  @override
  Future<List<Map>> getProductsBySpecificCategory(String name) async {
    final response = await httpClient.get(ApiConst.productsByCategoryURL(name));
    final list = response.data as List<Map<String, dynamic>>;
    return list;
  }

  @override
  Future<Map> getSingleProductById(int id) async {
    final response = await httpClient.get(ApiConst.productsByIdURL(id));
    final result = response.data as Map<String, dynamic>;
    return result;
  }
}
