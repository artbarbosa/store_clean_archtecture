import 'package:flutter/material.dart';

import '../../../../../../core/shared/widgets/custom_circular_progress_indicator.dart';

class ProductComponentLoading extends StatefulWidget {
  const ProductComponentLoading({Key? key}) : super(key: key);

  @override
  State<ProductComponentLoading> createState() =>
      _ProductComponentLoadingState();
}

class _ProductComponentLoadingState extends State<ProductComponentLoading> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CustomCircularProgressIndicator(),
    );
  }
}
