import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:sky_booker/presentation/base/bloc_observer.dart';
import 'package:sky_booker/presentation/resources/language_manger.dart';

import 'app/app.dart';
import 'app/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();  // Ensure localization is initialized
  await initAppModule();
  GetIt.instance.allowReassignment = true;

  Bloc.observer = AppMyBlocObserver();
  runApp(
    EasyLocalization(
      supportedLocales: AppLanguages.locals,
      path: AppLanguages.translationsPath,
      fallbackLocale: AppLanguages.fallBackLocal,
      startLocale: AppLanguages.startLocal,
      useOnlyLangCode: true,
      saveLocale: true,
      child: const MyApp(),
    ),
  );
}
