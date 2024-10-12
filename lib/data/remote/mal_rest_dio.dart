import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'rest_client.dart';

final Provider<Dio> dioProvider = Provider<Dio>((ProviderRef<Dio> ref) {
  final Dio dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(milliseconds: 30000),
      sendTimeout: const Duration(milliseconds: 30000),
      receiveTimeout: const Duration(milliseconds: 30000),
      contentType: 'application/json',
      receiveDataWhenStatusError: true,
      headers: <String, String>{
        HttpHeaders.acceptHeader: 'application/json',
      },
    ),
  );

  dio.interceptors.addAll(<Interceptor>[
    PrettyDioLogger(
      requestBody: true,
    ),
  ]);

  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (RequestOptions options, RequestInterceptorHandler handler) async {
        //final token = await ref.read(authTokenProvider);
        /*final authNotifier = ref.read(authProvider.notifier);
        var token = authNotifier.getLoggedUserToken();

        //print for debug purposes
        authNotifier.printLongString(token);

        if (token != "") {
          options.headers['Authorization'] = 'Bearer $token';
        }*/

        return handler.next(options);
      },
    ),
  );
  return dio;
});

//TODO
// Create a Mock Dio provider for RestClient using the new Dio instance
final Provider<RestClient> restClientLigaProvider = Provider<RestClient>((ProviderRef<RestClient> ref) {
  final Dio dio = ref.watch(dioProvider);
  return RestClient(dio, baseUrl: 'https://ligaportugal.dev.magycal.com/api/');
});

// Create a Mock Dio provider for RestClient using the new Dio instance
final Provider<RestClient> restClientDioProvider = Provider<RestClient>((ProviderRef<RestClient> ref) {
  final Dio dio = ref.watch(dioProvider);
  return RestClient(dio, baseUrl: 'https://mocki.io/v1/');
});

// Create a Dio provider for RestClient with authorization
final Provider<RestClient> restClientDioProviderWithAuthorization = Provider<RestClient>((ProviderRef<RestClient> ref) {
  final Dio dio = ref.watch(dioProvider);
  return RestClient(dio, baseUrl: 'https://magycal-ott.s3.eu-west-1.amazonaws.com/');
});
