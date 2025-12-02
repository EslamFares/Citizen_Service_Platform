import 'package:dio/dio.dart';

import 'server_failure.dart';

ServerFailure handelDioExceptions(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
      return ServerFailure(
        'timeout: $e',
        status: 4081,
        errorResponse: e.response,
      );
    case DioExceptionType.sendTimeout:
      return ServerFailure(
        'sendTimeout: $e',
        status: 4082,
        errorResponse: e.response,
      );
    case DioExceptionType.receiveTimeout:
      return ServerFailure(
        'receiveTimeout: $e',
        status: 4083,
        errorResponse: e.response,
      );
    case DioExceptionType.badCertificate:
      return ServerFailure(
        'bad Certificate: $e',
        status: 4084,
        errorResponse: e.response,
      );
    case DioExceptionType.cancel:
      return ServerFailure(
        'canceled: $e',
        status: 4085,
        errorResponse: e.response,
      );
    case DioExceptionType.connectionError:
      return ServerFailure(
        'connection Error: $e',
        status: 4086,
        errorResponse: e.response,
      );

    case DioExceptionType.unknown:
      return ServerFailure(
        'Error Type unknown: $e',
        status: 0,
        errorResponse: e.response,
      );

    case DioExceptionType.badResponse:
      switch (e.response?.statusCode) {
        case 400: //Bad request
          return ServerFailure(
            'Error 400 Bad request: ${e.response?.data}',
            status: 400,
            errorResponse: e.response,
          );
        case 401: //unauthorized
          return ServerFailure(
            'Error 401 Unauthorized: ${e.response?.data}',
            status: 401,
            errorResponse: e.response,
          );
        case 403: //forbidden
          return ServerFailure(
            'Error 403 Forbidden: ${e.response?.data}',
            status: 403,
            errorResponse: e.response,
          );
        case 404: //notfound //# can handel her ${e.response?.data['error']['message']}
          return ServerFailure(
            'Error 404 Not found , Your request is not found, please try again:',
            status: 404,
            errorResponse: e.response,
          );
        case 409: //cpfficient
          return ServerFailure(
            'Error 409 Conflict: ${e.response?.data}',
            status: 409,
            errorResponse: e.response,
          );
        case 422: //unprocessable Entity
          return ServerFailure(
            // 'Error 422 Unprocessable Entity: ${e.response?.data}');
            'Error 422 Unprocessable Entity: ${e.response}',
            status: 422,
            errorResponse: e.response,
          );
        case 503: //Bad request
          return ServerFailure(
            'Error 503 Service Unavailable: ${e.response?.data}',
            status: 503,
            errorResponse: e.response,
          );
        case 504: //Bad request
          return ServerFailure(
            'Error 504 Gateway Timeout: ${e.response?.data}',
            status: 504,
            errorResponse: e.response,
          );
        case 500: //Internal Server Error
          return ServerFailure(
            'Error 500 Internal Server Error: ${e.response?.data}',
            status: 500,
            errorResponse: e.response,
          );
        default:
          return ServerFailure(
            'bad Response Unknown: ${e.response?.data}',
            status: e.response?.statusCode ?? 1,
            errorResponse: e.response,
          );
      }
  }
}
