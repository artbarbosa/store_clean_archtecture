import 'package:dio/dio.dart';
import 'package:mocktail/mocktail.dart';
import 'package:store_clean_archtecture/src/core/modules/product/domain/entities/product_entity.dart';
import 'package:store_clean_archtecture/src/core/modules/product/domain/repositories/product_repository.dart';
import 'package:store_clean_archtecture/src/core/modules/product/domain/usecases/get_all_categorys_usecase.dart';
import 'package:store_clean_archtecture/src/core/modules/product/domain/usecases/get_all_products_usecase.dart';
import 'package:store_clean_archtecture/src/core/modules/product/domain/usecases/get_products_by_specific_category_usecase.dart';
import 'package:store_clean_archtecture/src/core/modules/product/domain/value_objects/category.dart';
import 'package:store_clean_archtecture/src/core/modules/product/infra/datasource/product_datasource.dart';
import 'package:store_clean_archtecture/src/core/modules/product/infra/model/product_model.dart';
import 'package:store_clean_archtecture/src/core/modules/user/domain/entities/user_entity.dart';
import 'package:store_clean_archtecture/src/core/modules/user/domain/value_objects/name.dart';
import 'package:store_clean_archtecture/src/core/shared/services/remote/http_client_service.dart';
import 'package:store_clean_archtecture/src/modules/cart/domain/entities/cart_entity.dart';
import 'package:store_clean_archtecture/src/modules/cart/domain/repositories/cart_repository.dart';

class HttpServiceMock extends Mock implements IHttpService {}

class DioMock extends Mock implements Dio {}

class ResponseMock extends Mock implements Response {}

class ProductRepositoryMock extends Mock implements IProductRepository {}

class CartRepositoryMock extends Mock implements ICartRepository {}

class ProductEntityMock extends Mock implements ProductEntity {}

class IProductDataSoucerMock extends Mock implements IProductDataSource {}

class GetAllProductsUseCaseMock extends Mock implements IGetAllProductsUseCase {
}

class GetProductsBySpecificCategoryUseCaseMock extends Mock
    implements IGetProductsBySpecificCategoryUseCase {}

class GetAllCategorysUseCaseMock extends Mock
    implements IGetAllCategorysUseCase {}

final category = Category(name: "men's clothing");

final listCategory = [category];

final firstAllCategory = Category(name: "All");

final productEntity = ProductEntity(
  id: '1',
  title: "Fjallraven",
  description: "Your perfect pack for everyday use and walks in the forest.",
  price: 109.95,
  category: category,
);

final productEntityInvalid = ProductEntity(
    id: '',
    title: '',
    description: '',
    price: double.infinity,
    category: category);

final productMap = {
  "id": 1,
  "title": "Fjallraven",
  "price": 109.95,
  "description": "Your perfect pack for everyday use and walks in the forest.",
  "category": "men's clothing",
  "image": "https://test",
};

final nameObject = Name(firstName: 'Arthur', lastName: 'Barbosa');

final cartEntity = CartEntity(
  id: 1,
  products: [productEntity],
  user: userEntity,
);

final userEntity = UserEntity(
  id: 1,
  email: 'test@gmail.com',
  username: 'arthur',
  name: nameObject,
);

final userEntityInvalid = UserEntity(
  id: 1,
  email: '',
  username: '',
  name: nameObject,
);

final listCategorys = [
  "electronics",
  "jewelery",
  "men's clothing",
  "women's clothing"
];

final productModel = ProductModel(
    id: 1,
    title: 'Fjallraven',
    description: "Your perfect pack for everyday use and walks in the forest.",
    price: 109.95,
    category: category,
    image: "https://test");

final listProductModel = [productModel];
