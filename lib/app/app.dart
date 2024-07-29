import 'package:flutter/material.dart';

import '../presentation/resources/routes_manger.dart';
import '../presentation/resources/theme_manger.dart';
import 'package:easy_localization/easy_localization.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.mainLayOutRoute,
      onGenerateRoute: RouteGenerator.getRoute,
      theme: getApplicationTheme(),
      localizationsDelegates: context.localizationDelegates,

    );
  }
}
