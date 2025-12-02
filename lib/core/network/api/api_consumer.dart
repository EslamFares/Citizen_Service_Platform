import 'package:dio/dio.dart';

abstract class ApiConsumer {
  Future<dynamic> get({
    required String path,
    Map<String, dynamic>? query,
    Map<String, String>? headers,
    ResponseType? responseType,
    Object? data,
    bool useAuth = true,
    String? contentType,
  });
  Future<dynamic> post({
    required String path,
    Map<String, dynamic>? query,
    Map<String, String>? headers,
    ResponseType? responseType,
    Object? data,
    bool isFormData = false,
    bool useAuth = true,
    String? contentType,
  });
  Future<dynamic> patch({
    required String path,
    Map<String, dynamic>? query,
    Map<String, String>? headers,
    ResponseType? responseType,
    Object? data,
    bool isFormData = false,
    bool useAuth = true,
    String? contentType,
  });
  Future<dynamic> delete({
    required String path,
    Map<String, dynamic>? query,
    Map<String, String>? headers,
    ResponseType? responseType,
    Object? data,
    bool isFormData = false,
    bool useAuth = true,
    String? contentType,
  });
  Future<dynamic> download(
      {required String pathUrl,
      String? folderPathToSaveFile,
      required String fileName,
      Map<String, dynamic>? query,
      Map<String, String>? headers,
      ResponseType? responseType,
      Object? data,
      bool isFormData = false,
      bool useAuth = true,
      String? contentType,
      Function(double)? onProgressUpdate,
      Function(String)? fileFullPathAfterDownload});
}
