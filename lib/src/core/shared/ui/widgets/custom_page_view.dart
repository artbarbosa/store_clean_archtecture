import 'package:flutter/material.dart';

import '../../../../modules/home/presenter/router/home_route.dart';

class CustomPageView extends StatefulWidget {
  const CustomPageView({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final PageController controller;
  @override
  State<CustomPageView> createState() => _CustomPageViewState();
}

class _CustomPageViewState extends State<CustomPageView> {
  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: const ScrollPhysics(),
      controller: widget.controller,
      children: [
        const HomeRouter(),
        Container(),
        Container(),
      ],
    );
  }
}
