import 'package:citizen_service_platform/core/network/func/error_status_tr.dart';
import 'package:citizen_service_platform/core/utils/log/logger.dart';
import 'package:dio/dio.dart';

import 'error_model/error_model.dart';

abstract class Failure {
  final String message;
  final int? status;
  final Response? errorResponse;
  final String msg;
  final String userMsg;
  final String msgApi;

  Failure(this.message, {this.status, this.errorResponse})
    : userMsg = errorStautsTr(status),
      msgApi = _extractApiMessage(message, errorResponse, status),
      msg = _extarctMsg(message);

  static String _extractApiMessage(
    String message,
    Response? errorResponse,
    int? status,
  ) {
    logger.i("errorResponse: $errorResponse");
    String apiMessage = "";
    if (errorResponse != null) {
      try {
        ErrorModel errorModel = ErrorModel.fromMap(errorResponse.data);
        apiMessage = errorModel.errorMessage ?? "";
        if (apiMessage.isEmpty) {
          apiMessage = errorResponse.toString();
        }
      } catch (_) {
        logPro.error("error in extract ApiMessage");
      }
    }
    if (apiMessage.isEmpty) {
      apiMessage = errorStautsTr(status);
    }
    return apiMessage;
  }

  static String _extarctMsg(String message) {
    final parts = message.split(": ");
    return parts.isNotEmpty ? parts[0].trim() : message;
  }

  @override
  String toString() {
    return 'Failure(message: $message, status: $status, errorResponse: $errorResponse, msg: $msg, userMsg: $userMsg, msgApi: $msgApi)';
  }
}
// abstract class Failure extends UserMassage {
//   final String message;

//   final int? status;
//   final Response? errorResponse;
//   Failure(
//     this.message, {
//     this.status,
//     this.errorResponse,
//   }) : super(message, status);
// }

// abstract class UserMassage {
//   String msg;
//   String userMsg = "";
//   final int? _status;
//   UserMassage(this.msg, this._status) {
//     userMsg = errorStautsTr(_status);
//     msg = msg.contains(": ") ? msg.split(": ")[0].trim() : msg;
//   }
// }
