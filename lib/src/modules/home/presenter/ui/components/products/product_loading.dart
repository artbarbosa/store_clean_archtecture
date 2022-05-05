import 'package:flutter/material.dart';

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
      child: CircularProgressIndicator(),
    );
  }
}
