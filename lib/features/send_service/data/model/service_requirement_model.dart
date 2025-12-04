// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class ServiceRequirementModel extends Equatable {
  final String? id;
  final String? title;
  final String? description;
  final List<String> requiredDocuments;
  final String? applicationSteps;
  final List<String> filesRequired;
  const ServiceRequirementModel({
    this.id,
    this.title,
    this.description,
    required this.requiredDocuments,
    this.applicationSteps,
    required this.filesRequired,
  });

  ServiceRequirementModel copyWith({
    String? id,
    String? title,
    String? description,
    List<String>? requiredDocuments,
    String? applicationSteps,
    List<String>? filesRequired,
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
      'filesRequired': filesRequired,
    };
  }

  factory ServiceRequirementModel.fromMap(Map<String, dynamic> map) {
    return ServiceRequirementModel(
      id: map['id'] != null ? map['id'] as String : null,
      title: map['title'] != null ? map['title'] as String : null,
      description: map['description'] != null
          ? map['description'] as String
          : null,
      requiredDocuments: List<String>.from(
        (map['requiredDocuments'] as List<String>),
      ),
      applicationSteps: map['applicationSteps'] != null
          ? map['applicationSteps'] as String
          : null,
      filesRequired: List<String>.from((map['filesRequired'] as List<String>)),
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
