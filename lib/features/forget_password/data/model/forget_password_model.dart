import 'dart:convert';

import 'package:equatable/equatable.dart';

class ForgetPasswordModel extends Equatable {
  final String? data;
  const ForgetPasswordModel({this.data});

  ForgetPasswordModel copyWith({String? data}) {
    return ForgetPasswordModel(
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'data': data,
    };
  }

  factory ForgetPasswordModel.fromMap(Map<String, dynamic> map) {
    return ForgetPasswordModel(
      data: map['data'] != null ? map['data'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ForgetPasswordModel.fromJson(String source) =>
      ForgetPasswordModel.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [data];
}
