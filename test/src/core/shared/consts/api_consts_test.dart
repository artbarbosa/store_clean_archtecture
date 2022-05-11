import 'package:flutter_test/flutter_test.dart';
import 'package:store_clean_archtecture/src/core/shared/consts/api_consts.dart';

void main() {
  const String allProductsURL = 'https://fakestoreapi.com/products';
  const String allCategoriesURL =
      'https://fakestoreapi.com/products/categories';
  const String productsByIdURL = 'https://fakestoreapi.com/products/1';
  const String productsByCategoryURL =
      'https://fakestoreapi.com/products/category/wear';
  const String getCartById = 'https://fakestoreapi.com/carts/1';
  const String addProductToCart = 'https://fakestoreapi.com/carts/1';
  const String deleteProductToCart = 'https://fakestoreapi.com/carts/1';

  group('ApiConst - allProductsURL', () {
    test('Should Return URL Api String', () async {
      var result = ApiConst.allProductsURL();

      expect(result, allProductsURL);
    });
  });
  group('ApiConst - allCategoriesURL', () {
    test('Should Return URL Api String', () async {
      var result = ApiConst.allCategoriesURL();

      expect(result, allCategoriesURL);
    });
  });
  group('ApiConst - productsByIdURL', () {
    test('Should Return URL Api String', () async {
      var result = ApiConst.productsByIdURL('1');

      expect(result, productsByIdURL);
    });
  });
  group('ApiConst - productsByCategoryURL', () {
    test('Should Return URL Api String', () async {
      var result = ApiConst.productsByCategoryURL('wear');

      expect(result, productsByCategoryURL);
    });
  });
  group('ApiConst - getCartById', () {
    test('Should Return URL Api String', () async {
      var result = ApiConst.getCartById();

      expect(result, getCartById);
    });
  });

  group('ApiConst - addProductToCart', () {
    test('Should Return URL Api String', () async {
      var result = ApiConst.addProductToCart();

      expect(result, addProductToCart);
    });
  });
  group('ApiConst - deleteProductToCart', () {
    test('Should Return URL Api String', () async {
      var result = ApiConst.deleteProductToCart();

      expect(result, deleteProductToCart);
    });
  });
}
