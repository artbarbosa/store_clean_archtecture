import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';

class CustomNavigationBarController extends ValueNotifier<int> {
  CustomNavigationBarController(super.value);

  PageController pageController = PageController();

  ScrollController scrollController = ScrollController();

  ValueNotifier<bool> isVisible = ValueNotifier<bool>(true);

  int get selectedIndex => value;

  void changePage(int index) {
    pageController.jumpToPage(index);
    value = index;
  }

  void _hideNav() {
    isVisible.value = false;
  }

  void _showNav() {
    isVisible.value = true;
  }

  void scrollAddListener() {
    scrollController.addListener(() {
      if (scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        _showNav();
      } else {
        _hideNav();
      }
    });
  }

  void scrollRemoveListener() {
    scrollController.removeListener(() {
      if (scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        _hideNav();
      } else {
        _showNav();
      }
    });
  }
}
