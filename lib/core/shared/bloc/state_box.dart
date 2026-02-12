import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class StateBox<T> extends Equatable {
  final StatusType type;
  final String? errorMessage;
  final T? data;
  const StateBox({required this.type, this.errorMessage, this.data});
  //-----------------------use extension------------------------------
  // bool get isInitial => type == StatusType.initial;
  // bool get isLoading => type == StatusType.loading;
  // bool get isSuccess => type == StatusType.success;
  // bool get isError => type == StatusType.error;
  //-----------------------------------------------------

  const StateBox.initial() : this(type: StatusType.initial);
  const StateBox.loading() : this(type: StatusType.loading);

  const StateBox.refreshing() : this(type: StatusType.refreshing);
  const StateBox.paginating() : this(type: StatusType.paginating);

  const StateBox.success({required T data})
    : this(type: StatusType.success, data: data);
  const StateBox.successWithoutData() : this(type: StatusType.success);

  const StateBox.error({String? errorMessage})
    : this(type: StatusType.error, errorMessage: errorMessage);

  /*
  example of usage =>

   state.copyWith(getHome: StateBox.success(data: data,)),
  
   !----- Old --------
   state.copyWith(getHome: StateBox.paginating()),
   ....to send data .......
   state.copyWith(getHome: state.getHome.copyWith(type: StatusType.paginating),),

   *----- New --------
   state.copyWith(getHome: state.getHome.toPaginating()),
   .... or ....
   state.copyWith(getHome: state.getHome.toStatus(StatusType.paginating)),

     */
  //*======================With Save old Data===============================*/

  //Transition methods that preserve existing data
  StateBox<T> toPaginating() => copyWith(type: StatusType.paginating);
  StateBox<T> toRefreshing() => copyWith(type: StatusType.refreshing);
  StateBox<T> toLoading() => copyWith(type: StatusType.loading);
  // Transition to success with new data
  StateBox<T> toSuccess(T newData) =>
      copyWith(type: StatusType.success, data: newData);
  StateBox<T> toSuccessWithoutData() => copyWith(type: StatusType.success);

  // To error while keeping old data visible
  StateBox<T> toError(String message) =>
      copyWith(type: StatusType.error, errorMessage: message);

  //global
  // Transition status but keep existing data (for pagination/loading)
  StateBox<T> toStatus(StatusType newType, {String? errorMessage, T? data}) {
    return copyWith(
      type: newType,
      errorMessage: errorMessage ?? this.errorMessage,
      data: data ?? this.data,
    );
  }
  //*=====================================================*/

  StateBox<T> copyWith({StatusType? type, String? errorMessage, T? data}) {
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
enum StatusType { initial, loading, refreshing, paginating, success, error }

extension StateBoxExtension on StateBox {
  bool get isInitial => type == StatusType.initial;
  bool get isLoading => type == StatusType.loading;
  bool get isRefreshing => type == StatusType.refreshing;
  bool get isPaginating => type == StatusType.paginating;
  bool get isSuccess => type == StatusType.success;
  bool get isError => type == StatusType.error;
}
