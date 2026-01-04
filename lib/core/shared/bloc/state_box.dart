import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class StateBox<T> extends Equatable {
  final StatusType type;
  final String? errorMessage;
  final T? data;
  const StateBox({
    required this.type,
    this.errorMessage,
    this.data,
  });
  //-----------------------use extension------------------------------
  // bool get isInitial => type == StatusType.initial;
  // bool get isLoading => type == StatusType.loading;
  // bool get isSuccess => type == StatusType.success;
  // bool get isError => type == StatusType.error;
  //-----------------------------------------------------

  const StateBox.initial() : this(type: StatusType.initial);
  const StateBox.loading() : this(type: StatusType.loading);
  const StateBox.success({required T data})
      : this(type: StatusType.success, data: data);
  const StateBox.successWithoutData() : this(type: StatusType.success);
  const StateBox.error({String? errorMessage})
      : this(type: StatusType.error, errorMessage: errorMessage);
  //-----------------------------------------------------

  StateBox<T> copyWith({
    StatusType? type,
    String? errorMessage,
    T? data,
  }) {
    return StateBox(
      type: type ?? this.type,
      errorMessage: errorMessage ?? this.errorMessage,
      data: data ?? this.data,
    );
  }

  @override
  String toString() {
    return type.name.toUpperCase();
  }

  @override
  List<Object?> get props => [type, errorMessage, data];
}

//-----------------------------------------------------
enum StatusType {
  initial,
  loading,
  success,
  error,
}

extension StateBoxExtension on StateBox {
  bool get isInitial => type == StatusType.initial;
  bool get isLoading => type == StatusType.loading;
  bool get isSuccess => type == StatusType.success;
  bool get isError => type == StatusType.error;
}
