import 'package:dio/dio.dart';

import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:sky_booker/domain/usecase/search_usecase.dart';

import '../data/data_source/remote_data_source.dart';

import '../data/network/app_api.dart';
import '../data/network/dio_factory.dart';
import '../data/network/network_info.dart';
import '../data/repository/repository_impl.dart';
import '../domain/repository/repository.dart';
import '../domain/usecase/home_usecase.dart';

final sl = GetIt.instance;

Future<void> initAppModule() async {
  //network info
  sl.registerLazySingleton<NetworkInfo>(
          () => NetworkInfoImpl(InternetConnection()));
  //dio factory
  var dio = await DioFactory().getDio();
  sl.registerLazySingleton<Dio>(() => dio);

  //app services client
  sl.registerLazySingleton<AppServicesClient>(() => AppServicesClient(sl()));

  //Remote data source
  sl.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl(sl()));

  //Repository
  sl.registerLazySingleton<Repository>(() => RepositoryImpl(sl(), sl()));

}

void intiHomeUseCase() {
  if (GetIt.instance.isRegistered<HomeUseCase>() == false) {
    sl.registerFactory<HomeUseCase>(() => HomeUseCase(sl()));
  }
}

void intiHomeSearchUseCase() {
  if (GetIt.instance.isRegistered<SearchProductUseCase>() == false) {
    sl.registerFactory<SearchProductUseCase>(() => SearchProductUseCase(sl()));
  }
}
