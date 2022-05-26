import 'package:flutter/material.dart';

import '../../../../../../core/modules/product/infra/model/product_model.dart';
import '../../../../../detail/presenter/router/detail_arguments.dart';

class ProductComponent extends StatelessWidget {
  const ProductComponent({super.key, required this.listProduct});

  final List<ProductModel> listProduct;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: listProduct.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: (363 / 636),
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.of(context).pushNamed('/detail',
                arguments: DetailArguments(productId: listProduct[index].id));
          },
          child: Container(
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
                      height: 160,
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
              )),
        );
      },
    );
  }
}
