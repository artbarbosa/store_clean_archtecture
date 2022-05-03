import 'package:flutter/material.dart';
import 'package:store_clean_archtecture/src/core/modules/product/domain/value_objects/category.dart';

class CategoryComponent extends StatelessWidget {
  const CategoryComponent({
    Key? key,
    required this.listCategorys,
  }) : super(key: key);

  final List<Category> listCategorys;
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
