import 'package:dio/dio.dart';

import '../../app/constants.dart';

class DioFactory{

  Future<Dio> getDio() async{
    Dio dio = Dio();

    Map<String, String> headers = {
      // CONTENT_TYPE: APPLICATION_JSON,
      // ACCEPT: APPLICATION_JSON,
      // AUTHORIZATION: Constants.token,
    };

    dio.options = BaseOptions(
      baseUrl: Constants.baseUrl,
      headers: headers,
      responseType: ResponseType.json,  // Ensure it's set to JSON
      receiveTimeout: const Duration(milliseconds: Constants.apiTimeOut),
      sendTimeout: const Duration(
        milliseconds: Constants.apiTimeOut,
      ),
    );

    return dio;
  }
}