//ServiceCategoryModel
import 'dart:convert';

class ServiceCategoriesModel {
  final bool? isSuccess;
  final List<ServiceCategoryModel>? data;

  ServiceCategoriesModel({this.isSuccess, this.data});

  ServiceCategoriesModel copyWith({
    bool? isSuccess,
    List<ServiceCategoryModel>? data,
  }) => ServiceCategoriesModel(
    isSuccess: isSuccess ?? this.isSuccess,
    data: data ?? this.data,
  );

  factory ServiceCategoriesModel.fromJson(String str) =>
      ServiceCategoriesModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ServiceCategoriesModel.fromMap(Map<String, dynamic> json) =>
      ServiceCategoriesModel(
        isSuccess: json["isSuccess"],
        data: json["data"] == null
            ? []
            : List<ServiceCategoryModel>.from(
                json["data"]!.map((x) => ServiceCategoryModel.fromMap(x)),
              ),
      );

  Map<String, dynamic> toMap() => {
    "isSuccess": isSuccess,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
  };
}

class ServiceCategoryModel {
  final int? id;
  final String? name;

  ServiceCategoryModel({this.id, this.name});

  ServiceCategoryModel copyWith({int? id, String? name}) =>
      ServiceCategoryModel(id: id ?? this.id, name: name ?? this.name);

  factory ServiceCategoryModel.fromJson(String str) =>
      ServiceCategoryModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ServiceCategoryModel.fromMap(Map<String, dynamic> json) =>
      ServiceCategoryModel(id: json["id"], name: json["name"]);

  Map<String, dynamic> toMap() => {"id": id, "name": name};
}
