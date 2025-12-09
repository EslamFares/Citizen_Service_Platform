import 'dart:convert';

class UserModel {
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

  UserModel({
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

  UserModel copyWith({
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
  }) => UserModel(
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

  factory UserModel.fromJson(String str) => UserModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
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
