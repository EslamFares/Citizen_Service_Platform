import 'dart:convert';

class MyRequestsModel {
  final bool? isSuccess;
  final String? message;
  final String? statusCode;
  final List<RequestItem>? data;

  MyRequestsModel({this.isSuccess, this.message, this.statusCode, this.data});

  MyRequestsModel copyWith({
    bool? isSuccess,
    String? message,
    String? statusCode,
    List<RequestItem>? data,
  }) => MyRequestsModel(
    isSuccess: isSuccess ?? this.isSuccess,
    message: message ?? this.message,
    statusCode: statusCode ?? this.statusCode,
    data: data ?? this.data,
  );

  factory MyRequestsModel.fromJson(String str) =>
      MyRequestsModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MyRequestsModel.fromMap(Map<String, dynamic> json) => MyRequestsModel(
    isSuccess: json["isSuccess"],
    message: json["message"],
    statusCode: json["statusCode"],
    data: json["data"] == null
        ? []
        : List<RequestItem>.from(
            json["data"]!.map((x) => RequestItem.fromMap(x)),
          ),
  );

  Map<String, dynamic> toMap() => {
    "isSuccess": isSuccess,
    "message": message,
    "statusCode": statusCode,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
  };
}

class RequestItem {
  final int? id;
  final String? serviceName;
  final String? createdAt;
  final String? status;
  final bool? isPaid;

  RequestItem({
    this.id,
    this.serviceName,
    this.createdAt,
    this.status,
    this.isPaid,
  });

  RequestItem copyWith({
    int? id,
    String? serviceName,
    String? createdAt,
    String? status,
    bool? isPaid,
  }) => RequestItem(
    id: id ?? this.id,
    serviceName: serviceName ?? this.serviceName,
    createdAt: createdAt ?? this.createdAt,
    status: status ?? this.status,
    isPaid: isPaid ?? this.isPaid,
  );

  factory RequestItem.fromJson(String str) =>
      RequestItem.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RequestItem.fromMap(Map<String, dynamic> json) => RequestItem(
    id: json["id"],
    serviceName: json["serviceName"],
    createdAt: json["createdAt"],
    status: json["status"],
    isPaid: json["isPaid"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "serviceName": serviceName,
    "createdAt": createdAt,
    "status": status,
    "isPaid": isPaid,
  };
}
