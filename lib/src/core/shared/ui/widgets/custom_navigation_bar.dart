import 'package:flutter/material.dart';

import '../controllers/custom_navigation_bar_controller.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({Key? key, required this.controller})
      : super(key: key);

  final CustomNavigationBarController controller;

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  final controllerbar = CustomNavigationBarController(0);

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: widget.controller.selectedIndex,
      onDestinationSelected: (value) {
        widget.controller.changePage(value);
      },
      destinations: const [
        NavigationDestination(
          label: 'Home',
          icon: Icon(Icons.home),
        ),
        NavigationDestination(
          label: 'Cart',
          icon: Icon(Icons.shopping_cart),
        ),
        NavigationDestination(
          label: 'Settings',
          icon: Icon(Icons.settings),
        )
      ],
    );
  }
}
