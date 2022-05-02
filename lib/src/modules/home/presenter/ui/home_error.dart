import 'package:flutter/material.dart';

class HomeError extends StatefulWidget {
  const HomeError({Key? key, required this.errorMessage}) : super(key: key);

  final String errorMessage;

  @override
  State<HomeError> createState() => _HomeErrorState();
}

class _HomeErrorState extends State<HomeError> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(widget.errorMessage),
    );
  }
}
