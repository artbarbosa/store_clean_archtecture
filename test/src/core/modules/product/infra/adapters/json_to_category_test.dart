import 'package:flutter_test/flutter_test.dart';
import 'package:store_clean_archtecture/src/core/modules/product/domain/value_objects/category.dart';
import 'package:store_clean_archtecture/src/core/modules/product/infra/adapters/json_to_category.dart';

void main() {
  test('Shold convert Map to ProductEntity', () {
    final categoryMap = {'name': "men's clothing"};

    final product = JsonToCategory.fromMap(categoryMap);

    expect(product, isA<Category>());
    expect(product.name, "men's clothing");
  });

  test('Shold convert ProductEntity to Map', () {
    final category = Category(name: "men's clothing");

    final map = JsonToCategory.toMap(category);

    expect(map['category'], "men's clothing");
  });
}
