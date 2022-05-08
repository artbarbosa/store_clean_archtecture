import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:store_clean_archtecture/src/core/modules/product/external/datasource/product_datasource_imp.dart';

import '../../../../../../mocks/mock.dart';

void main() {
  late HttpServiceMock httpClient;
  late ProductDataSourceImp datasource;

  setUpAll(() {
    httpClient = HttpServiceMock();
    datasource = ProductDataSourceImp(httpClient: httpClient);
  });

  group('ProductDataSourceImp - getAllProducts', () {
    test('Should return List<Map>', () async {
      when(() => httpClient.get(any())).thenAnswer((_) async => Response(
            requestOptions: RequestOptions(path: ''),
            data: [productMap],
          ));

      final result = await datasource.getAllProducts();

      expect(result, isA<List<Map>>());
      expect(result.first['id'], 1);
    });
  });

  group('ProductDataSourceImp - getProductsBySpecificCategory', () {
    test('Should return List<Map>', () async {
      when(() => httpClient.get(any())).thenAnswer((_) async => Response(
            requestOptions: RequestOptions(path: ''),
            data: [productMap],
          ));

      final result = await datasource.getProductsBySpecificCategory('');

      expect(result, isA<List<Map>>());
      expect(result.first['id'], 1);
    });
  });

  group('ProductDataSourceImp - getSingleProductById', () {
    test('Should return Map', () async {
      when(() => httpClient.get(any())).thenAnswer((_) async => Response(
            requestOptions: RequestOptions(path: ''),
            data: productMap,
          ));

      final result = await datasource.getSingleProductById('1');

      expect(result, isA<Map>());
      expect(result['id'], 1);
    });
  });
  group('ProductDataSourceImp - getAllCategorys', () {
    test('Should return List', () async {
      when(() => httpClient.get(any())).thenAnswer((_) async => Response(
            requestOptions: RequestOptions(path: ''),
            data: listCategorys,
          ));

      final result = await datasource.getAllCategorys();

      expect(result, isA<List>());
      expect(result[0], 'electronics');
    });
  });
}
