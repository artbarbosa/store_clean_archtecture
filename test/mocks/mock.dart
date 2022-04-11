import 'package:mocktail/mocktail.dart';
import 'package:store_clean_archtecture/src/modules/product/domain/entities/product_entity.dart';
import 'package:store_clean_archtecture/src/modules/product/domain/repositories/product_repository.dart';
import 'package:store_clean_archtecture/src/modules/product/infra/datasource/product_datasource.dart';

class ProductRepositoryMock extends Mock implements IProductRepository {}

class ProductEntityMock extends Mock implements ProductEntity {}

class IProductDataSoucerMock extends Mock implements IProductDataSoucer {}

final productMap = {
  "id": 1,
  "title": "Fjallraven",
  "price": 109.95,
  "description":
      "Your perfect pack for everyday use and walks in the forest.",
  "category": "men's clothing",
  "image": "https://test",
};
