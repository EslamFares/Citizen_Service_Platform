import 'dart:convert';

class UserModel {
  final bool? isSuccess;
  final String? errorMessage;
  final String? errorCode;
  final UserModelData? data;

  UserModel({this.isSuccess, this.errorMessage, this.errorCode, this.data});

  UserModel copyWith({
    bool? isSuccess,
    String? errorMessage,
    String? errorCode,
    UserModelData? data,
  }) => UserModel(
    isSuccess: isSuccess ?? this.isSuccess,
    errorMessage: errorMessage ?? this.errorMessage,
    errorCode: errorCode ?? this.errorCode,
    data: data ?? this.data,
  );

  factory UserModel.fromRawJson(String str) =>
      UserModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    isSuccess: json["isSuccess"],
    errorMessage: json["errorMessage"],
    errorCode: json["errorCode"],
    data: json["data"] == null ? null : UserModelData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "isSuccess": isSuccess,
    "errorMessage": errorMessage,
    "errorCode": errorCode,
    "data": data?.toJson(),
  };
}

class UserModelData {
  final String? message;
  final bool? isAuthenticated;
  final String? userId;
  final String? imagePath;
  final String? fullName;
  final String? phoneNumber;
  final String? token;
  final String? location;

  UserModelData({
    this.message,
    this.isAuthenticated,
    this.userId,
    this.imagePath,
    this.fullName,
    this.phoneNumber,
    this.token,
    this.location,
  });

  UserModelData copyWith({
    String? message,
    bool? isAuthenticated,
    String? userId,
    String? imagePath,
    String? fullName,
    String? phoneNumber,
    String? token,
    String? location,
  }) => UserModelData(
    message: message ?? this.message,
    isAuthenticated: isAuthenticated ?? this.isAuthenticated,
    userId: userId ?? this.userId,
    imagePath: imagePath ?? this.imagePath,
    fullName: fullName ?? this.fullName,
    phoneNumber: phoneNumber ?? this.phoneNumber,
    token: token ?? this.token,
    location: location ?? this.location,
  );

  factory UserModelData.fromRawJson(String str) =>
      UserModelData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserModelData.fromJson(Map<String, dynamic> json) => UserModelData(
    message: json["message"],
    isAuthenticated: json["isAuthenticated"],
    userId: json["userId"],
    imagePath: json["imagePath"],
    fullName: json["fullName"],
    phoneNumber: json["phoneNumber"],
    token: json["token"],
    location: json["location"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "isAuthenticated": isAuthenticated,
    "userId": userId,
    "imagePath": imagePath,
    "fullName": fullName,
    "phoneNumber": phoneNumber,
    "token": token,
    "location": location,
  };
}
