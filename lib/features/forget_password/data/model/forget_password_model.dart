import 'dart:convert';

class IsHaveAccountModel {
  final bool? isSuccess;
  final String? message;
  final String? statusCode;
  final IsHaveAccountModelData? data;

  IsHaveAccountModel({
    this.isSuccess,
    this.message,
    this.statusCode,
    this.data,
  });

  IsHaveAccountModel copyWith({
    bool? isSuccess,
    String? message,
    String? statusCode,
    IsHaveAccountModelData? data,
  }) => IsHaveAccountModel(
    isSuccess: isSuccess ?? this.isSuccess,
    message: message ?? this.message,
    statusCode: statusCode ?? this.statusCode,
    data: data ?? this.data,
  );

  factory IsHaveAccountModel.fromJson(String str) =>
      IsHaveAccountModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory IsHaveAccountModel.fromMap(Map<String, dynamic> json) =>
      IsHaveAccountModel(
        isSuccess: json["isSuccess"],
        message: json["message"],
        statusCode: json["statusCode"],
        data: json["data"] == null
            ? null
            : IsHaveAccountModelData.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
    "isSuccess": isSuccess,
    "message": message,
    "statusCode": statusCode,
    "data": data?.toMap(),
  };
}

class IsHaveAccountModelData {
  final String? isHave;

  IsHaveAccountModelData({this.isHave});

  IsHaveAccountModelData copyWith({String? isHave}) =>
      IsHaveAccountModelData(isHave: isHave ?? this.isHave);

  factory IsHaveAccountModelData.fromJson(String str) =>
      IsHaveAccountModelData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory IsHaveAccountModelData.fromMap(Map<String, dynamic> json) =>
      IsHaveAccountModelData(isHave: json["isHave"]);

  Map<String, dynamic> toMap() => {"isHave": isHave};
}
