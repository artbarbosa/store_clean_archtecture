import 'package:flutter/material.dart';

import '../../../../../../core/modules/product/infra/model/product_model.dart';

class ProductComponent extends StatelessWidget {
  const ProductComponent({Key? key, required this.listProduct})
      : super(key: key);

  final List<ProductModel> listProduct;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      itemCount: listProduct.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: (1 / 1.4),
        mainAxisExtent: 240,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) {
        return Container(
            decoration: BoxDecoration(
              color: const Color(0xFFFFFFFF),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Image.network(
                  listProduct[index].image,
                  fit: BoxFit.contain,
                ),
                Expanded(
                  child: Container(
                    color: Colors.red,
                  ),
                )
              ],
            ));
      },
    );
  }
}
