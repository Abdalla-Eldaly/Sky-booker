import 'package:flutter/material.dart';
import 'package:sky_booker/app/di.dart';
import 'package:sky_booker/presentation/resources/string_manger.dart';
import '../main_layout/view/main_layout.dart';

class Routes {
  Routes._();

  static const String mainLayOutRoute = '/mainLayOut';

}

class RouteGenerator {
  RouteGenerator._();

  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.mainLayOutRoute:
        return MaterialPageRoute(builder: (_) =>  const MainLayOut());




      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.noRouteFound),
        ),
        body: const Center(child: Text(AppStrings.noRouteFound)),
      ),
    );
  }
}
