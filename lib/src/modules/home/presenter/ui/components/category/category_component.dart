import 'package:flutter/material.dart';

import '../../../../../../core/modules/product/domain/value_objects/category.dart';

class CategoryComponent extends StatefulWidget {
  const CategoryComponent({
    Key? key,
    required this.listCategorys,
  }) : super(key: key);

  final List<Category> listCategorys;

  @override
  State<CategoryComponent> createState() => _CategoryComponentState();
}

class _CategoryComponentState extends State<CategoryComponent> {
  var currentSelected = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        height: 25,
        child: ListView.separated(
          separatorBuilder: (_, index) => const SizedBox(width: 20),
          padding: const EdgeInsets.symmetric(horizontal: 5),
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              setState(() {
                currentSelected = index;
              });
            },
            child: Text(
              widget.listCategorys[index].name,
              style: TextStyle(
                fontSize: 16,
                fontWeight: currentSelected == index
                    ? FontWeight.bold
                    : FontWeight.w500,
                color: currentSelected == index ? Colors.black : Colors.grey,
              ),
            ),
          ),
        ));
  }
}
