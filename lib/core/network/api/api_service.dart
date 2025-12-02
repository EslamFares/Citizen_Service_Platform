import 'dart:io';

import 'package:citizen_service_platform/core/cash/secure_storage_helper.dart';
import 'package:citizen_service_platform/core/dependency_injection/get_it_setup.dart';
import 'package:citizen_service_platform/core/network/api/dio_cancel_request_manager.dart';
import 'package:citizen_service_platform/core/utils/app_config/app_config_environments.dart';
import 'package:citizen_service_platform/core/utils/app_utils/app_consts.dart';
import 'package:citizen_service_platform/core/utils/log/logger.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../errors/server_failure.dart';
import 'api_consts.dart';
import 'api_consumer.dart';
import 'api_interceptor.dart';

//ToDo: in main UserCubit(ApiService(dio: Dio())),
class ApiService extends ApiConsumer {
  final Dio dio;
  static final instance = getIt<ApiService>();
  ApiService({required this.dio}) {
    dio.options = BaseOptions(
      //TODo: add base url
      baseUrl: ApiConsts.baseUrl,
      // headers: {"Authorization": "Bearer ey-79ZItiIP5abaNM",},
      receiveDataWhenStatusError: true,
    );
    // Simply add PrettyDioLogger to your dio interceptors.
    dio.interceptors.add(
      PrettyDioLogger(
        enabled: appConfig.enablePrettyDioLogger,
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
      ),
    );

    // to add option in (request ex=>headers) & error & respons but i add for every method a lone
    dio.interceptors.add(ApiInterceptor());
  }

  // Helper method to get headers based on `useAuth`
  // Map<String, String> _getStaticHeaders({bool useAuth = true}) {
  //   return {
  //     if (useAuth) ...ApiConsts.headerToken,
  //   };
  // }
  Future<Map<String, String>> _buildHeaders({
    bool useAuth = true,
    Map<String, String>? customHeaders,
  }) async {
    final headers = <String, String>{'Accept': 'application/json'};

    if (useAuth) {
      final token = await SecureStorageHelper.read<String>(AppConst.kToken);
      if (token != null && token.isNotEmpty) {
        headers['Authorization'] = 'Bearer $token';
      }
    }

    if (customHeaders != null) {
      headers.addAll(customHeaders);
    }

    return headers;
  }

  @override
  Future get({
    required String path,
    Map<String, dynamic>? query,
    ResponseType? responseType,
    Object? data,
    Map<String, String>? headers,
    String? contentType,
    bool useAuth = true,
  }) async {
    try {
      final header = await _buildHeaders(
        useAuth: useAuth,
        customHeaders: headers,
      );
      final response = await dio.get(
        path,
        queryParameters: query,
        cancelToken: DioCancelRequestManager.addRequest(path),
        data: data,
        options: Options(
          responseType: responseType,
          //ex=>  contentType: Headers.formUrlEncodedContentType,
          contentType: contentType ?? 'application/json',
          //{'Authorization': 'Bearer $token'}
          headers: header,
        ),
      );
      return response.data;
    } on DioException catch (e) {
      throw ServerFailure.fromDioError(e);
    }
  }

  @override
  Future delete({
    required String path,
    Map<String, dynamic>? query,
    dynamic data,
    bool isFormData = false,
    bool useAuth = true,
    Map<String, String>? headers,
    String? contentType,
    ResponseType? responseType,
  }) async {
    try {
      final header = await _buildHeaders(
        useAuth: useAuth,
        customHeaders: headers,
      );

      final response = await dio.delete(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: query,
        cancelToken: DioCancelRequestManager.addRequest(path),
        options: Options(
          responseType: responseType,

          //ex=>  contentType: Headers.formUrlEncodedContentType,
          contentType:
              contentType ??
              (isFormData ? 'multipart/form-data' : 'application/json'),
          headers: header,
        ),
      );
      return response.data;
    } on DioException catch (e) {
      throw ServerFailure.fromDioError(e);
    }
  }

  @override
  Future patch({
    required String path,
    Map<String, dynamic>? query,
    Map<String, String>? headers,
    ResponseType? responseType,
    dynamic data,
    bool isFormData = false,
    bool useAuth = true,
    String? contentType,
  }) async {
    try {
      final header = await _buildHeaders(
        useAuth: useAuth,
        customHeaders: headers,
      );

      final response = await dio.patch(
        path,
        queryParameters: query,
        cancelToken: DioCancelRequestManager.addRequest(path),
        data: isFormData ? FormData.fromMap(data) : data,
        options: Options(
          responseType: responseType,
          //ex=>  contentType: Headers.formUrlEncodedContentType,
          contentType:
              contentType ??
              (isFormData ? 'multipart/form-data' : 'application/json'),
          headers: header,
        ),
      );
      return response.data;
    } on DioException catch (e) {
      throw ServerFailure.fromDioError(e);
    }
  }

  @override
  Future post({
    required String path,
    Map<String, dynamic>? query,
    Map<String, String>? headers,
    dynamic data,
    bool isFormData = false,
    bool useAuth = true,
    String? contentType,
    ResponseType? responseType,
  }) async {
    try {
      final header = await _buildHeaders(
        useAuth: useAuth,
        customHeaders: headers,
      );

      final response = await dio.post(
        path,
        queryParameters: query,
        cancelToken: DioCancelRequestManager.addRequest(path),
        data: isFormData ? FormData.fromMap(data) : data,
        options: Options(
          //ex=>  contentType: Headers.formUrlEncodedContentType,
          contentType:
              contentType ??
              (isFormData ? 'multipart/form-data' : 'application/json'),
          responseType: responseType,
          headers: header,
        ),
      );
      return response.data;
    } on DioException catch (e) {
      throw ServerFailure.fromDioError(e);
    }
  }

  @override
  Future download({
    required String pathUrl,
    required String fileName,
    String? folderPathToSaveFile,
    Map<String, dynamic>? query,
    Map<String, String>? headers,
    dynamic data,
    bool isFormData = false,
    bool useAuth = true,
    String? contentType,
    ResponseType? responseType,
    Function(double)? onProgressUpdate,
    Function(String)? fileFullPathAfterDownload,
  }) async {
    try {
      // Get the app's document directory
      Directory appDocDir =
          (await getDownloadsDirectory() ??
          await getApplicationDocumentsDirectory());

      String savePath = '${folderPathToSaveFile ?? (appDocDir.path)}/$fileName';

      // Download the file
      await dio.download(
        pathUrl,
        savePath,
        onReceiveProgress: (received, total) {
          if (total != -1) {
            final progress = received / total;
            // Callback for UI updates
            if (onProgressUpdate != null) {
              onProgressUpdate(progress);
            }
          }
        },
      );

      if (fileFullPathAfterDownload != null) {
        fileFullPathAfterDownload(savePath);
      }
      logger.i('File downloaded to: $savePath');
    } on DioException catch (e) {
      throw ServerFailure.fromDioError(e);
    }
  }
}
  // Future uploadImage({required int projectId, required File file}) async {
  //   Map<String, dynamic> dataFile = {'file': await MultipartFile.fromFile(file.path)};
  //   return await api.post(
  //     responseType: ResponseType.json,
  //     path: ApiConsts.uploadImage,
  //     isFormData: true,
  //     data: {
  //       "projectId": projectId,
  //       ...dataFile,
  //     },
  //   );
  // }

  //   Future downloadFile(
  //     {required String path,
  //     required String fileName,
  //     Function(double)? onProgressUpdate}) async {
  //   await api.download(
  //     path: path,
  //     fileName: fileName,
  //     onProgressUpdate: onProgressUpdate,
  //   );
  // }