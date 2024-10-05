import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myanimelist_app/data/remote/rest_client.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final dioProvider = Provider<Dio>((ref) {
  final dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(milliseconds: 30000),
      sendTimeout: const Duration(milliseconds: 30000),
      receiveTimeout: const Duration(milliseconds: 30000),
      contentType: 'application/json',
      receiveDataWhenStatusError: true,
      headers: {
        HttpHeaders.acceptHeader: "application/json",
      },
    ),
  );

  dio.interceptors.addAll([
    PrettyDioLogger(
      requestBody: true,
      requestHeader: false,
      request: true,
      responseBody: true,
      responseHeader: false,
    ),
  ]);

  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) async {
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

// Create a Mock Dio provider for RestClient using the new Dio instance
final restClientLigaProvider = Provider<RestClient>((ref) {
  final dio = ref.watch(dioProvider);
  return RestClient(dio, baseUrl: 'https://ligaportugal.dev.magycal.com/api/');
});

// Create a Mock Dio provider for RestClient using the new Dio instance
final restClientDioProvider = Provider<RestClient>((ref) {
  final dio = ref.watch(dioProvider);
  return RestClient(dio, baseUrl: 'https://mocki.io/v1/');
});

// Create a Dio provider for RestClient with authorization
final restClientDioProviderWithAuthorization = Provider<RestClient>((ref) {
  final dio = ref.watch(dioProvider);
  return RestClient(dio, baseUrl: 'https://magycal-ott.s3.eu-west-1.amazonaws.com/');
});
