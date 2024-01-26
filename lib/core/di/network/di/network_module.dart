import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flicker_api_app/common/constants/const_keeper.dart';
import 'package:flicker_api_app/core/services/network/interceptors/dio_token_interceptor.dart';
import 'package:flicker_api_app/core/services/network/interceptors/pretty_dio_logger.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

@module
abstract class NetworkModule {
  @singleton
  DioTokenInterceptor get _dioTokenInterceptor => DioTokenInterceptor();

  @singleton
  Dio get dio => _getDio();

  @lazySingleton
  InternetConnectionChecker get internetConnectionChecker => _internetConnectionChecker();

  @singleton
  PrettyDioLogger get prettyDioLogger => PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: true,
      error: true,
      compact: true,
      maxWidth: 180);

  _getDio() {
    var dio = Dio(BaseOptions(baseUrl: environment.url!));
    dio.interceptors.add(_dioTokenInterceptor);
    dio.interceptors.add(prettyDioLogger);
    dio.options.connectTimeout = const Duration(minutes: 10);
    dio.options.receiveTimeout = const Duration(seconds: 120);
    dio.options.sendTimeout = const Duration(seconds: 120);
    return dio;
  }

  _internetConnectionChecker() {
    if (kIsWeb) {
      return null;
    }
    InternetConnectionChecker internetConnectionChecker = InternetConnectionChecker.createInstance(
      checkTimeout: const Duration(seconds: 10), // Custom check timeout
      checkInterval: const Duration(seconds: 10), // Custom check interval
      addresses: [
        AddressCheckOptions(
          address: InternetAddress(
            '1.1.1.1', // CloudFlare
            type: InternetAddressType.IPv4,
          ),
        ),
        AddressCheckOptions(
          address: InternetAddress(
            '2606:4700:4700::1111', // CloudFlare
            type: InternetAddressType.IPv6,
          ),
        ),
        AddressCheckOptions(
          address: InternetAddress(
            '8.8.4.4', // Google
            type: InternetAddressType.IPv4,
          ),
        ),
        AddressCheckOptions(
          address: InternetAddress(
            '2001:4860:4860::8888', // Google
            type: InternetAddressType.IPv6,
          ),
        ),
        AddressCheckOptions(
          address: InternetAddress(
            '208.67.222.222', // OpenDNS
            type: InternetAddressType.IPv4,
          ), // OpenDNS
        ),
        AddressCheckOptions(
          address: InternetAddress(
            '2620:0:ccc::2', // OpenDNS
            type: InternetAddressType.IPv6,
          ), // OpenDNS
        ),
      ],
    );

    return internetConnectionChecker;
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}
