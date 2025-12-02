import 'dart:convert';

class ErrorModel {
  final bool? isSuccess;
  final String? errorMessage;
  final String? errorCode;
  final String? data;

  ErrorModel({this.isSuccess, this.errorMessage, this.errorCode, this.data});

  ErrorModel copyWith({
    bool? isSuccess,
    String? errorMessage,
    String? errorCode,
    String? data,
  }) =>
      ErrorModel(
        isSuccess: isSuccess ?? this.isSuccess,
        errorMessage: errorMessage ?? this.errorMessage,
        errorCode: errorCode ?? this.errorCode,
        data: data ?? this.data,
      );

  factory ErrorModel.fromRawJson(String str) =>
      ErrorModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ErrorModel.fromJson(Map<String, dynamic> json) => ErrorModel(
        isSuccess: json["isSuccess"],
        errorMessage: json["errorMessage"],
        errorCode: json["errorCode"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "isSuccess": isSuccess,
        "errorMessage": errorMessage,
        "errorCode": errorCode,
        "data": data,
      };
}
