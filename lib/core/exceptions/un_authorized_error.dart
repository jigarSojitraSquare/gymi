import 'dart:io';

import 'package:dio/dio.dart';

import 'localized_error.dart';
import 'network_error.dart';

class UnAuthorizedError extends NetworkError with LocalizedError {
  static const statusCode = HttpStatus.unauthorized;

  UnAuthorizedError(DioError dioError, {String? statusCode})
      : super(dioError, statusCodeValue: statusCode);

  @override
  String getLocalizedKey() => 'UnAuthorized';

  @override
  String? get getErrorCode {
    if (statusCodeValue == null) return '$statusCode';
    return '$statusCode [$statusCodeValue]';
  }
}
