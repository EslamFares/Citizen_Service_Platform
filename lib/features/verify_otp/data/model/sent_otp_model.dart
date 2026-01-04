import 'dart:convert';

class SentOtpModel {
  final bool? isSuccess;
  final String? errorMessage;
  final String? errorCode;
  final SentOtpModelData? data;

  SentOtpModel({this.isSuccess, this.errorMessage, this.errorCode, this.data});

  SentOtpModel copyWith({
    bool? isSuccess,
    String? errorMessage,
    String? errorCode,
    SentOtpModelData? data,
  }) => SentOtpModel(
    isSuccess: isSuccess ?? this.isSuccess,
    errorMessage: errorMessage ?? this.errorMessage,
    errorCode: errorCode ?? this.errorCode,
    data: data ?? this.data,
  );

  factory SentOtpModel.fromJson(String str) =>
      SentOtpModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SentOtpModel.fromMap(Map<String, dynamic> json) => SentOtpModel(
    isSuccess: json["isSuccess"],
    errorMessage: json["errorMessage"],
    errorCode: json["errorCode"],
    data: json["data"] == null ? null : SentOtpModelData.fromMap(json["data"]),
  );

  Map<String, dynamic> toMap() => {
    "isSuccess": isSuccess,
    "errorMessage": errorMessage,
    "errorCode": errorCode,
    "data": data?.toMap(),
  };
}

class SentOtpModelData {
  final String? message;

  SentOtpModelData({this.message});

  SentOtpModelData copyWith({String? message}) =>
      SentOtpModelData(message: message ?? this.message);

  factory SentOtpModelData.fromJson(String str) =>
      SentOtpModelData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SentOtpModelData.fromMap(Map<String, dynamic> json) =>
      SentOtpModelData(message: json["message"]);

  Map<String, dynamic> toMap() => {"message": message};
}
