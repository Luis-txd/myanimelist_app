import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class GenericErrorInterceptor extends QueuedInterceptor {
  GenericErrorInterceptor._(BuildContext context) {
    _context = context;
  }
  static late BuildContext _context;
  static GenericErrorInterceptor? _instance;

  static void initialize(BuildContext context) {
    _instance ??= GenericErrorInterceptor._(context);
  }

  static GenericErrorInterceptor get instance => _instance!;

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final errorCode = response.data['data_code'];

    if (errorCode != null && errorCode != 0) {
      switch (errorCode) {
        default:
          {
            //TODO show generic popup
            break;
          }
      }
    }

    super.onResponse(response, handler);
  }
}
