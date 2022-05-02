import 'package:flutter/material.dart';

import '../../../modules/home/presenter/router/home_route.dart';

class Routers {
  static String get initialRoute => '/home';

  static Map<String, Widget Function(BuildContext, dynamic)> routes = {
    '/': (_, __) => const HomeRouter(),
  };

  static Route? generateRoutes(RouteSettings settings) {
    final routerName = settings.name;
    final routerArgs = settings.arguments;

    final navigateTo = routes[routerName];
    if (navigateTo == null) return null;

    return MaterialPageRoute(
      builder: (context) => navigateTo.call(context, routerArgs),
    );
  }
}
