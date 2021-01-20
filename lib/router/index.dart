import 'package:flutter/material.dart';
import 'package:osaka_website/pages/index.dart';
import 'simple_route.dart';

Route<dynamic> buildRouters(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return defaultRoute();
    default:
      return defaultRoute();
  }
}

SimpleRoute defaultRoute() {
  return SimpleRoute(
      name: '/', title: 'Flutter Osaka', builder: (context) => IndexPage());
}