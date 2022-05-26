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
  @override
  void initState() {
    super.initState();
    widget.controller.scrollAddListener();
  }

  @override
  void dispose() {
    widget.controller.scrollRemoveListener();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.controller.isVisible,
      builder: (_, __) => AnimatedContainer(
        duration: const Duration(milliseconds: 1000),
        curve: Curves.fastLinearToSlowEaseIn,
        height:
            widget.controller.isVisible.value ? kBottomNavigationBarHeight : 0,
        child: Wrap(
          children: [
            NavigationBar(
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
            )
          ],
        ),
      ),
    );
  }
}
