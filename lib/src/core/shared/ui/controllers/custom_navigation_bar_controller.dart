import 'package:flutter/cupertino.dart';

class CustomNavigationBarController extends ValueNotifier<int> {
  CustomNavigationBarController(super.value);
  var pageController = PageController();

  int get selectedIndex => value;

  void changePage(int index) {
    pageController.jumpToPage(index);
    value = index;
  }
}
