import 'package:flutter/material.dart';

import '../../../../core/modules/product/domain/value_objects/category.dart';
import '../../../../core/modules/product/infra/model/product_model.dart';

class HomePage extends StatelessWidget {
  const HomePage(
      {Key? key, required this.listCategory, required this.listProduct})
      : super(key: key);

  final List<Category> listCategory;
  final List<ProductModel> listProduct;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        ListTile(title: Text('asd')),
        ListTile(title: Text('asd')),
        ListTile(title: Text('asd')),
        ListTile(title: Text('asd')),
        ListTile(title: Text('asd')),
        ListTile(title: Text('asd')),
        ListTile(title: Text('asd')),
        ListTile(title: Text('asd')),
        ListTile(title: Text('asd')),
        ListTile(title: Text('asd')),
        ListTile(title: Text('asd')),
      ],
    );
  }
}
