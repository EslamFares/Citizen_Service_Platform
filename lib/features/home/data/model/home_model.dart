// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class ServicesModel extends Equatable {
  final bool? isSuccess;
  final List<ServicesItemModel>? servicesModelData;
  const ServicesModel({this.isSuccess, this.servicesModelData});

  ServicesModel copyWith({
    bool? isSuccess,
    List<ServicesItemModel>? servicesModelData,
  }) {
    return ServicesModel(
      isSuccess: isSuccess ?? this.isSuccess,
      servicesModelData: servicesModelData ?? this.servicesModelData,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'isSuccess': isSuccess,
      'servicesModelData': servicesModelData?.map((x) => x.toMap()).toList(),
    };
  }

  factory ServicesModel.fromMap(Map<String, dynamic> map) {
    return ServicesModel(
      isSuccess: map['isSuccess'] != null ? map['isSuccess'] as bool : null,
      servicesModelData: map['servicesModelData'] != null
          ? List<ServicesItemModel>.from(
              (map['servicesModelData'] as List<int>).map<ServicesItemModel?>(
                (x) => ServicesItemModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ServicesModel.fromJson(String source) =>
      ServicesModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [isSuccess, servicesModelData];
}

class ServicesItemModel extends Equatable {
  final String? name;
  final String? image;
  final int? id;
  const ServicesItemModel({this.name, this.image, this.id});

  ServicesItemModel copyWith({String? name, String? image, int? id}) {
    return ServicesItemModel(
      name: name ?? this.name,
      image: image ?? this.image,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'name': name, 'image': image, 'id': id};
  }

  factory ServicesItemModel.fromMap(Map<String, dynamic> map) {
    return ServicesItemModel(
      name: map['name'] != null ? map['name'] as String : null,
      image: map['image'] != null ? map['image'] as String : null,
      id: map['id'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ServicesItemModel.fromJson(String source) =>
      ServicesItemModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [name, image, id];
}
