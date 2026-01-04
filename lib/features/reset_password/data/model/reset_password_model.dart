import 'dart:convert';

import 'package:equatable/equatable.dart';

class ResetPasswordModel extends Equatable {
  final String? data;
  const ResetPasswordModel({this.data});

  ResetPasswordModel copyWith({String? data}) {
    return ResetPasswordModel(
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'data': data,
    };
  }

  factory ResetPasswordModel.fromMap(Map<String, dynamic> map) {
    return ResetPasswordModel(
      data: map['data'] != null ? map['data'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ResetPasswordModel.fromJson(String source) =>
      ResetPasswordModel.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [data];
}
