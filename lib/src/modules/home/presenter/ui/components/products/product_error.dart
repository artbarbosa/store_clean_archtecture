import 'package:flutter/material.dart';

class ProductComponentError extends StatefulWidget {
  const ProductComponentError({Key? key, required this.errorMessage})
      : super(key: key);

  final String errorMessage;

  @override
  State<ProductComponentError> createState() => _ProductComponentErrorState();
}

class _ProductComponentErrorState extends State<ProductComponentError> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(widget.errorMessage),
    );
  }
}
