import 'failure.dart';
import 'handel_dio_exceptions.dart';
import 'package:dio/dio.dart';

class ServerFailure extends Failure {
  //implements Exception
  ServerFailure(super.message, {super.status, super.errorResponse});
  factory ServerFailure.fromDioError(DioException e) {
    return handelDioExceptions(e);
  }
}

class ConnectionFailure extends Failure {
  final String? msgConnect;
  ConnectionFailure({this.msgConnect = kConnectionFailerMassage})
      : super(msgConnect ?? kConnectionFailerMassage);
}

const String kConnectionFailerMassage = "No Internet Connection";
