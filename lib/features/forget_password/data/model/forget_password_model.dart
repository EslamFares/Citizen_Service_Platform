import 'dart:convert';

class ForgetPasswordModel {
  final bool? isSuccess;
  final String? message;
  final String? statusCode;
  final ResetPasswordModelData? data;

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
    ResetPasswordModelData? data,
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
        data: json["data"] == null
            ? null
            : ResetPasswordModelData.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
    "isSuccess": isSuccess,
    "message": message,
    "statusCode": statusCode,
    "data": data?.toMap(),
  };
}

class ResetPasswordModelData {
  final String? message;
  final bool? isAuthenticated;
  final String? fullName;
  final String? email;
  final String? token;
  final String? expiresOn;
  final String? userId;
  final String? image;
  final int? branchId;
  final String? branchName;
  final String? nationalId;

  ResetPasswordModelData({
    this.message,
    this.isAuthenticated,
    this.fullName,
    this.email,
    this.token,
    this.expiresOn,
    this.userId,
    this.image,
    this.branchId,
    this.branchName,
    this.nationalId,
  });

  ResetPasswordModelData copyWith({
    String? message,
    bool? isAuthenticated,
    String? fullName,
    String? email,
    String? token,
    String? expiresOn,
    String? userId,
    String? image,
    int? branchId,
    String? branchName,
    String? nationalId,
  }) => ResetPasswordModelData(
    message: message ?? this.message,
    isAuthenticated: isAuthenticated ?? this.isAuthenticated,
    fullName: fullName ?? this.fullName,
    email: email ?? this.email,
    token: token ?? this.token,
    expiresOn: expiresOn ?? this.expiresOn,
    userId: userId ?? this.userId,
    image: image ?? this.image,
    branchId: branchId ?? this.branchId,
    branchName: branchName ?? this.branchName,
    nationalId: nationalId ?? this.nationalId,
  );

  factory ResetPasswordModelData.fromJson(String str) =>
      ResetPasswordModelData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ResetPasswordModelData.fromMap(Map<String, dynamic> json) =>
      ResetPasswordModelData(
        message: json["message"],
        isAuthenticated: json["isAuthenticated"],
        fullName: json["fullName"],
        email: json["email"],
        token: json["token"],
        expiresOn: json["expiresOn"],
        userId: json["userId"],
        image: json["image"],
        branchId: json["branchId"],
        branchName: json["branchName"],
        nationalId: json["nationalId"],
      );

  Map<String, dynamic> toMap() => {
    "message": message,
    "isAuthenticated": isAuthenticated,
    "fullName": fullName,
    "email": email,
    "token": token,
    "expiresOn": expiresOn,
    "userId": userId,
    "image": image,
    "branchId": branchId,
    "branchName": branchName,
    "nationalId": nationalId,
  };
}
