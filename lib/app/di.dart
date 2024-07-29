import 'package:dio/dio.dart';

import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';


import '../data/network/app_api.dart';
import '../data/network/dio_factory.dart';
import '../data/network/network_info.dart';
import '../data/repository/repository_impl.dart';


final sl = GetIt.instance;

Future<void> initAppModule() async {
  //network info
  sl.registerLazySingleton<NetworkInfo>(
          () => NetworkInfoImpl(InternetConnection()));
  //dio factory
  var dio = await DioFactory().getDio();
  sl.registerLazySingleton<Dio>(() => dio);

  // //app services client
  // sl.registerLazySingleton<AppServicesClient>(() => AppServicesClient(sl()));
  //
  // //Remote data source
  // sl.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl(sl()));

  //Repository
  // sl.registerLazySingleton<Repository>(() => RepositoryImpl(sl(), sl()));

}


