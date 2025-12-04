// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class ServiceRequirementModel extends Equatable {
  final String? id;
  final String? title;
  final String? description;
  final List<String>? requiredDocuments;
  final String? applicationSteps;
  final List<FilesRequiredModel>? filesRequired;
  const ServiceRequirementModel({
    this.id,
    this.title,
    this.description,
    this.requiredDocuments,
    this.applicationSteps,
    this.filesRequired,
  });

  ServiceRequirementModel copyWith({
    String? id,
    String? title,
    String? description,
    List<String>? requiredDocuments,
    String? applicationSteps,
    List<FilesRequiredModel>? filesRequired,
  }) {
    return ServiceRequirementModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      requiredDocuments: requiredDocuments ?? this.requiredDocuments,
      applicationSteps: applicationSteps ?? this.applicationSteps,
      filesRequired: filesRequired ?? this.filesRequired,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'requiredDocuments': requiredDocuments,
      'applicationSteps': applicationSteps,
      'filesRequired': filesRequired?.map((x) => x.toMap()).toList(),
    };
  }

  factory ServiceRequirementModel.fromMap(Map<String, dynamic> map) {
    return ServiceRequirementModel(
      id: map['id'] != null ? map['id'] as String : null,
      title: map['title'] != null ? map['title'] as String : null,
      description: map['description'] != null
          ? map['description'] as String
          : null,
      requiredDocuments: map['requiredDocuments'] != null
          ? List<String>.from((map['requiredDocuments'] as List<String>))
          : null,
      applicationSteps: map['applicationSteps'] != null
          ? map['applicationSteps'] as String
          : null,
      filesRequired: map['filesRequired'] != null
          ? List<FilesRequiredModel>.from(
              (map['filesRequired'] as List<int>).map<FilesRequiredModel?>(
                (x) => FilesRequiredModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ServiceRequirementModel.fromJson(String source) =>
      ServiceRequirementModel.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      title,
      description,
      requiredDocuments,
      applicationSteps,
      filesRequired,
    ];
  }
}

class FilesRequiredModel extends Equatable {
  final int? id;
  final String? name;
  final String? type;
  const FilesRequiredModel({this.id, this.name, this.type});

  FilesRequiredModel copyWith({int? id, String? name, String? type}) {
    return FilesRequiredModel(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'id': id, 'name': name, 'type': type};
  }

  factory FilesRequiredModel.fromMap(Map<String, dynamic> map) {
    return FilesRequiredModel(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      type: map['type'] != null ? map['type'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory FilesRequiredModel.fromJson(String source) =>
      FilesRequiredModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id, name, type];
}
