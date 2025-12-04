// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class MyRequestsModel extends Equatable {
  final bool isSuccess;
  final List<RequestsItem>? data;
  const MyRequestsModel({required this.isSuccess, this.data});

  MyRequestsModel copyWith({bool? isSuccess, List<RequestsItem>? data}) {
    return MyRequestsModel(
      isSuccess: isSuccess ?? this.isSuccess,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'isSuccess': isSuccess,
      'data': data?.map((x) => x.toMap()).toList(),
    };
  }

  factory MyRequestsModel.fromMap(Map<String, dynamic> map) {
    return MyRequestsModel(
      isSuccess: map['isSuccess'] as bool,
      data: map['data'] != null
          ? List<RequestsItem>.from(
              (map['data'] as List<int>).map<RequestsItem?>(
                (x) => RequestsItem.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory MyRequestsModel.fromJson(String source) =>
      MyRequestsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [isSuccess, data];
}

class RequestsItem extends Equatable {
  final int? id;
  final String? title;
  final int? code;
  final String? time;
  final String? status;
  final bool? payDone;
  const RequestsItem({
    this.id,
    this.title,
    this.code,
    this.time,
    this.status,
    this.payDone,
  });

  RequestsItem copyWith({
    int? id,
    String? title,
    int? code,
    String? time,
    String? status,
    String? payStatus,
    bool? payDone,
  }) {
    return RequestsItem(
      id: id ?? this.id,
      title: title ?? this.title,
      code: code ?? this.code,
      time: time ?? this.time,
      status: status ?? this.status,
      payDone: payDone ?? this.payDone,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'code': code,
      'time': time,
      'status': status,
      'payDone': payDone,
    };
  }

  factory RequestsItem.fromMap(Map<String, dynamic> map) {
    return RequestsItem(
      id: map['id'] != null ? map['id'] as int : null,
      title: map['title'] != null ? map['title'] as String : null,
      code: map['code'] != null ? map['code'] as int : null,
      time: map['time'] != null ? map['time'] as String : null,
      status: map['status'] != null ? map['status'] as String : null,
      payDone: map['payDone'] != null ? map['payDone'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory RequestsItem.fromJson(String source) =>
      RequestsItem.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [id, title, code, time, status, payDone];
  }
}
