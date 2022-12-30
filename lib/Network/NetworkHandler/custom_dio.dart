import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'dart:developer' as dev;

class CustomDio {
  static final CustomDio _singleton = CustomDio._internal();
  var dio = Dio();
  var logger = Logger();
  factory CustomDio() {
    return _singleton;
  }

  Future<Dio> getDio () async {
    dio.interceptors.clear();
    dio.interceptors.add(getInterceptorsWrapper());
    dio.options.headers['Consumerkey'] = 'ck_0cbe7da980cea94bba74b7639fe7352324975107';
    dio.options.headers['Consumersecret'] = 'cs_fd5be2b96589e672b3419b4eeccae804e43c0315';
    return dio;
  }

  InterceptorsWrapper getInterceptorsWrapper() {
    return InterceptorsWrapper(
        onRequest: (
      RequestOptions requestOptions,
      RequestInterceptorHandler handler,
    ) {
      dev.log("Headers--> \n ${requestOptions.headers}");
      dev.log(" Type--> ${requestOptions.method} Request-->${requestOptions.uri} \n  ");
      dev.log(" extra--> ${requestOptions.extra} data-->${requestOptions.data} queryParameters-->${requestOptions.queryParameters} \n  ");
      return handler.next(requestOptions);
    }, onResponse: (
      Response response,
      ResponseInterceptorHandler handler,
    ) {
      dev.log("data--> ${response.data}");
      dev.log("Response-->${response.realUri} \n statusCode--> ${response.statusCode} \n path--> ${response.requestOptions.path}  \n Headers--> \n ${response.headers} ");

      return handler.next(response);
    }, onError: (DioError dioError, ErrorInterceptorHandler handler) {
      dev.log("error -->${dioError.error} message -->${dioError.message}");
      dev.log("Type--> ${dioError.requestOptions.method} url-->${dioError.requestOptions.uri} \n Headers--> \n ${dioError.requestOptions.headers} data--> ${dioError.requestOptions.path}");

      handler.next(dioError);
    });
  }


  CustomDio._internal();
}
