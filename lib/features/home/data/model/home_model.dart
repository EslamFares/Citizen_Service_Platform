import 'dart:convert';

class ServicesModel {
  final bool? isSuccess;
  final ServicesModelData? data;

  ServicesModel({this.isSuccess, this.data});

  ServicesModel copyWith({bool? isSuccess, ServicesModelData? data}) =>
      ServicesModel(
        isSuccess: isSuccess ?? this.isSuccess,
        data: data ?? this.data,
      );

  factory ServicesModel.fromJson(String str) =>
      ServicesModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ServicesModel.fromMap(Map<String, dynamic> json) => ServicesModel(
    isSuccess: json["isSuccess"],
    data: json["data"] == null ? null : ServicesModelData.fromMap(json["data"]),
  );

  Map<String, dynamic> toMap() => {
    "isSuccess": isSuccess,
    "data": data?.toMap(),
  };
}

class ServicesModelData {
  final String? citizenName;
  final int? branchId;
  final String? branchName;
  final List<ServiceCategory>? serviceCategories;

  ServicesModelData({
    this.citizenName,
    this.branchId,
    this.branchName,
    this.serviceCategories,
  });

  ServicesModelData copyWith({
    String? citizenName,
    int? branchId,
    String? branchName,
    List<ServiceCategory>? serviceCategories,
  }) => ServicesModelData(
    citizenName: citizenName ?? this.citizenName,
    branchId: branchId ?? this.branchId,
    branchName: branchName ?? this.branchName,
    serviceCategories: serviceCategories ?? this.serviceCategories,
  );

  factory ServicesModelData.fromJson(String str) =>
      ServicesModelData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ServicesModelData.fromMap(Map<String, dynamic> json) =>
      ServicesModelData(
        citizenName: json["citizenName"],
        branchId: json["branchId"],
        branchName: json["branchName"],
        serviceCategories: json["serviceCategories"] == null
            ? []
            : List<ServiceCategory>.from(
                json["serviceCategories"]!.map(
                  (x) => ServiceCategory.fromMap(x),
                ),
              ),
      );

  Map<String, dynamic> toMap() => {
    "citizenName": citizenName,
    "branchId": branchId,
    "branchName": branchName,
    "serviceCategories": serviceCategories == null
        ? []
        : List<dynamic>.from(serviceCategories!.map((x) => x.toMap())),
  };
}

class ServiceCategory {
  final int? categoryId;
  final String? categoryName;
  final String? iconUrl;

  ServiceCategory({this.categoryId, this.categoryName, this.iconUrl});

  ServiceCategory copyWith({
    int? categoryId,
    String? categoryName,
    String? iconUrl,
  }) => ServiceCategory(
    categoryId: categoryId ?? this.categoryId,
    categoryName: categoryName ?? this.categoryName,
    iconUrl: iconUrl ?? this.iconUrl,
  );

  factory ServiceCategory.fromJson(String str) =>
      ServiceCategory.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ServiceCategory.fromMap(Map<String, dynamic> json) => ServiceCategory(
    categoryId: json["categoryId"],
    categoryName: json["categoryName"],
    iconUrl: json["iconURL"],
  );

  Map<String, dynamic> toMap() => {
    "categoryId": categoryId,
    "categoryName": categoryName,
    "iconURL": iconUrl,
  };
}
