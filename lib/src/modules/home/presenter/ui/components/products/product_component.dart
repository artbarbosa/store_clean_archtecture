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
        childAspectRatio: (363 / 636),
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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Spacer(),
                  Image.network(
                    listProduct[index].image,
                    fit: BoxFit.contain,
                    height: 150,
                    color: Colors.green,
                  ),
                  const Spacer(),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      height: 40,
                      color: Colors.red,
                      child: Column(
                        children: [
                          Text.rich(
                            TextSpan(
                              style: const TextStyle(
                                fontSize: 13,
                              ),
                              text: listProduct[index].title,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                          Text.rich(
                            TextSpan(
                              style: const TextStyle(
                                fontSize: 13,
                              ),
                              text: listProduct[index].price.toString(),
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ));
      },
    );
  }
}
