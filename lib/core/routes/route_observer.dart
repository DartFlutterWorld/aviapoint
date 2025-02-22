import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class MyRouteObserver extends AutoRouterObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    // ignore: avoid_print
    print('New route pushed: ${route.settings.name}');
  }

  // only override to observer tab routes
  @override
  void didInitTabRoute(TabPageRoute route, TabPageRoute? previousRoute) {
    // print('Tab route visited: ${route.name}');
    // ignore: avoid_print
    print('Tab route path: ${route.path}');
  }

  @override
  void didChangeTabRoute(TabPageRoute route, TabPageRoute previousRoute) {
    // ignore: avoid_print
    print('Tab route re-visited: ${route.name}');
  }
}
