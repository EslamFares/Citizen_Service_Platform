// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class ServiceCategoriesModel extends Equatable {
  final String? name;
  final List<ServiceCategoryModel>? data;
  const ServiceCategoriesModel({this.name, this.data});

  ServiceCategoriesModel copyWith({
    String? name,
    List<ServiceCategoryModel>? data,
  }) {
    return ServiceCategoriesModel(
      name: name ?? this.name,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'data': data?.map((x) => x.toMap()).toList(),
    };
  }

  factory ServiceCategoriesModel.fromMap(Map<String, dynamic> map) {
    return ServiceCategoriesModel(
      name: map['name'] != null ? map['name'] as String : null,
      data: map['data'] != null
          ? List<ServiceCategoryModel>.from(
              (map['data'] as List<int>).map<ServiceCategoryModel?>(
                (x) => ServiceCategoryModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ServiceCategoriesModel.fromJson(String source) =>
      ServiceCategoriesModel.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [name, data];
}

class ServiceCategoryModel extends Equatable {
  final int? id;
  final String? name;
  const ServiceCategoryModel({this.id, this.name});

  ServiceCategoryModel copyWith({int? id, String? name}) {
    return ServiceCategoryModel(id: id ?? this.id, name: name ?? this.name);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'id': id, 'name': name};
  }

  factory ServiceCategoryModel.fromMap(Map<String, dynamic> map) {
    return ServiceCategoryModel(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ServiceCategoryModel.fromJson(String source) =>
      ServiceCategoryModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id, name];
}
