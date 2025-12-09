import 'dart:convert';

class ErrorModel {
  final bool? isSuccess;
  final String? errorMessage;
  final String? errorCode;
  final dynamic data;

  ErrorModel({this.isSuccess, this.errorMessage, this.errorCode, this.data});

  ErrorModel copyWith({
    bool? isSuccess,
    String? errorMessage,
    String? errorCode,
    dynamic data,
  }) => ErrorModel(
    isSuccess: isSuccess ?? this.isSuccess,
    errorMessage: errorMessage ?? this.errorMessage,
    errorCode: errorCode ?? this.errorCode,
    data: data ?? this.data,
  );

  factory ErrorModel.fromJson(String str) =>
      ErrorModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ErrorModel.fromMap(Map<String, dynamic> json) => ErrorModel(
    isSuccess: json["isSuccess"],
    errorMessage: json["errorMessage"],
    errorCode: json["errorCode"],
    data: json["data"],
  );

  Map<String, dynamic> toMap() => {
    "isSuccess": isSuccess,
    "errorMessage": errorMessage,
    "errorCode": errorCode,
    "data": data,
  };
}
