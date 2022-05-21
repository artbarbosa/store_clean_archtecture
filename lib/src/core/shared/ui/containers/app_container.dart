import 'package:flutter/material.dart';

import '../controllers/custom_navigation_bar_controller.dart';
import '../widgets/custom_navigation_bar.dart';
import '../widgets/custom_page_view.dart';

class AppContainer extends StatefulWidget {
  const AppContainer({Key? key}) : super(key: key);

  @override
  State<AppContainer> createState() => _AppContainerState();
}

class _AppContainerState extends State<AppContainer> {
  final controller = CustomNavigationBarController(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPageView(
        controller: controller.pageController,
      ),
      bottomNavigationBar: ValueListenableBuilder(
        valueListenable: controller,
        builder: (context, value, child) {
          return CustomNavigationBar(
            controller: controller,
          );
        },
      ),
    );
  }
}
