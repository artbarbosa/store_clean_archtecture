import 'package:dio/dio.dart';
import 'package:mocktail/mocktail.dart';
import 'package:store_clean_archtecture/src/core/services/remote/http_client_service.dart';
import 'package:store_clean_archtecture/src/modules/product/domain/entities/product_entity.dart';
import 'package:store_clean_archtecture/src/modules/product/domain/repositories/product_repository.dart';
import 'package:store_clean_archtecture/src/modules/product/infra/datasource/product_datasource.dart';

class HttpServiceMock extends Mock implements IHttpService {}

class DioMock extends Mock implements Dio {}

class ResponseMock extends Mock implements Response {}

class ProductRepositoryMock extends Mock implements IProductRepository {}

class ProductEntityMock extends Mock implements ProductEntity {}

class IProductDataSoucerMock extends Mock implements IProductDataSoucer {}

final productMap = {
  "id": 1,
  "title": "Fjallraven",
  "price": 109.95,
  "description": "Your perfect pack for everyday use and walks in the forest.",
  "category": "men's clothing",
  "image": "https://test",
};
