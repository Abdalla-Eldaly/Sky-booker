import 'package:flutter/material.dart';

import '../presentation/resources/routes_manger.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.mainLayOutRoute,
      onGenerateRoute: RouteGenerator.getRoute,
    );
  }
}
