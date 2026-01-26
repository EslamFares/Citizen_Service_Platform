import 'dart:convert';

import 'package:citizen_service_platform/features/login/data/model/login_model.dart';

class ForgetPasswordModel {
  final bool? isSuccess;
  final String? message;
  final String? statusCode;
  final UserModel? data;

  ForgetPasswordModel({
    this.isSuccess,
    this.message,
    this.statusCode,
    this.data,
  });

  ForgetPasswordModel copyWith({
    bool? isSuccess,
    String? message,
    String? statusCode,
    UserModel? data,
  }) => ForgetPasswordModel(
    isSuccess: isSuccess ?? this.isSuccess,
    message: message ?? this.message,
    statusCode: statusCode ?? this.statusCode,
    data: data ?? this.data,
  );

  factory ForgetPasswordModel.fromJson(String str) =>
      ForgetPasswordModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ForgetPasswordModel.fromMap(Map<String, dynamic> json) =>
      ForgetPasswordModel(
        isSuccess: json["isSuccess"],
        message: json["message"],
        statusCode: json["statusCode"],
        data: json["data"] == null ? null : UserModel.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
    "isSuccess": isSuccess,
    "message": message,
    "statusCode": statusCode,
    "data": data?.toMap(),
  };
}
