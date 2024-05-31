import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:gymi/core/di/Injectable.config.dart';
import 'package:gymi/core/interceptors/combining_smart_interceptor.dart';
import 'package:gymi/core/interceptors/network_auth_interceptor.dart';
import 'package:gymi/core/interceptors/network_error_interceptor.dart';
import 'package:gymi/core/interceptors/network_log_interceptor.dart';
import 'package:gymi/core/interceptors/network_refresh_interceptor.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt',
  generateForDir: ['lib'],
)
Future<void> configureDependencies() async {
  getIt.$initGetIt();
  await getIt.allReady();
}

@module
abstract class RegisterModule {
  @singleton
  CombiningSmartInterceptor provideCombiningSmartInterceptor(
    NetworkLogInterceptor logInterceptor,
    NetworkAuthInterceptor authInterceptor,
    NetworkErrorInterceptor errorInterceptor,
    NetworkRefreshInterceptor refreshInterceptor,
  ) =>
      CombiningSmartInterceptor()
        ..addInterceptor(authInterceptor)
        ..addInterceptor(refreshInterceptor)
        ..addInterceptor(errorInterceptor)
        ..addInterceptor(logInterceptor);

  @singleton
  Dio provideDio(CombiningSmartInterceptor interceptor) {
    // var baseURL = ConfigClass.baseUrl;
    final dio = Dio(
      BaseOptions(
        // baseUrl: baseURL,
        followRedirects: false,
        validateStatus: (status) {
          return status! >= 200 && status < 300 ||
              status == 304 ||
              status == 422 ||
              status == 401 ||
              status == 400;
        },
      ),
    );
    // ignore: avoid_as
    (dio.transformer as DefaultTransformer).jsonDecodeCallback = parseJson;
    dio.interceptors
      ..add(interceptor)
      ..add(
        kDebugMode
            ? PrettyDioLogger(
                requestHeader: true,
                requestBody: true,
                responseBody: true,
                responseHeader: true,
                error: true,
                compact: true,
                maxWidth: 10000,
              )
            : PrettyDioLogger(
                requestHeader: false,
                requestBody: false,
                responseBody: false,
                responseHeader: false,
                error: false,
                compact: false,
                maxWidth: 10000,
              ),
      );
    // ..add(getIt<CacheInterceptor>());
    return dio;
  }
}

dynamic parseJson(String text) => compute<String, dynamic>(_parseAndDecode, text);

dynamic _parseAndDecode(String response) => jsonDecode(response);
