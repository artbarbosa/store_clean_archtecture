import '../../../../shared/consts/api_consts.dart';
import '../../../../shared/services/remote/http_client_service.dart';
import '../../infra/datasource/product_datasource.dart';

class ProductDataSourceImp extends IProductDataSource {
  final IHttpService httpClient;

  ProductDataSourceImp({required this.httpClient});

  @override
  Future<List<dynamic>> getAllProducts() async {
    final response = await httpClient.get(ApiConst.allProductsURL());
    final list = response.data;
    return list as List<dynamic>;
  }

  @override
  Future<List<dynamic>> getProductsBySpecificCategory(String name) async {
    final response = await httpClient.get(ApiConst.productsByCategoryURL(name));
    final list = response.data;
    return list as List<dynamic>;
  }

  @override
  Future<Map> getSingleProductById(String id) async {
    final response = await httpClient.get(ApiConst.productsByIdURL(id));
    final result = response.data as Map<String, dynamic>;
    return result;
  }

  @override
  Future<List<dynamic>> getAllCategorys() async {
    final response = await httpClient.get(ApiConst.allCategoriesURL());
    final list = response.data;
    return list as List<dynamic>;
  }
}
