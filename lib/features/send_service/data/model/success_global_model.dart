import 'dart:convert';

class SuccessGlobalModel {
  final bool? isSuccess;
  final String? message;
  final String? statusCode;
  final dynamic data;

  SuccessGlobalModel({
    this.isSuccess,
    this.message,
    this.statusCode,
    this.data,
  });

  SuccessGlobalModel copyWith({
    bool? isSuccess,
    String? message,
    String? statusCode,
    dynamic data,
  }) => SuccessGlobalModel(
    isSuccess: isSuccess ?? this.isSuccess,
    message: message ?? this.message,
    statusCode: statusCode ?? this.statusCode,
    data: data ?? this.data,
  );

  factory SuccessGlobalModel.fromJson(String str) =>
      SuccessGlobalModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SuccessGlobalModel.fromMap(Map<String, dynamic> json) =>
      SuccessGlobalModel(
        isSuccess: json["isSuccess"],
        message: json["message"],
        statusCode: json["statusCode"],
        data: json["data"],
      );

  Map<String, dynamic> toMap() => {
    "isSuccess": isSuccess,
    "message": message,
    "statusCode": statusCode,
    "data": data,
  };
}
