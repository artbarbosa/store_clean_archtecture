import 'package:flutter_test/flutter_test.dart';
import 'package:store_clean_archtecture/src/modules/product/domain/entities/product_entity.dart';
import 'package:store_clean_archtecture/src/modules/product/domain/value_objects/category.dart';
import 'package:store_clean_archtecture/src/modules/product/infra/adapters/json_to_product.dart';
import 'package:store_clean_archtecture/src/modules/product/infra/model/product_model.dart';

import '../../../../../mocks/mock.dart';

void main() {
  test('Shold convert Map to ProductEntity', () {
    final product = JsonToProduct.fromMap(productMap);

    expect(product, isA<ProductModel>());
    expect(product, isA<ProductEntity>());
    expect(product.id, 1);
    expect(product.title, 'Fjallraven');
    expect(product.category, isA<Category>());
    expect(product.category.name, "men's clothing");
  });

  test('Shold convert ProductEntity to Map', () {
    final category = Category(name: "men's clothing");

    final product = ProductModel(
      category: category,
      description: 'our perfect pack for everyday use and walks in the forest.',
      id: 1,
      image: 'https://test',
      price: 109.95,
      title: 'Fjallraven',
    );

    final map = JsonToProduct.toMap(product);

    expect(map['id'], 1);
    expect(map['title'], 'Fjallraven');
    expect(map['category'], "men's clothing");
  });
}
