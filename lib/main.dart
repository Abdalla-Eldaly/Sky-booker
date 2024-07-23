import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:sky_booker/presentation/base/bloc_observer.dart';

import 'app/app.dart';
import 'app/di.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initAppModule();
  GetIt.instance.allowReassignment = true; // Allow reassignment for tests

  Bloc.observer = AppMyBlocObserver();
  runApp(const MyApp());
}


