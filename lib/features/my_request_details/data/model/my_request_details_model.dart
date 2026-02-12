// import 'dart:convert';

// import 'package:equatable/equatable.dart';

// class MyRequestDetailsModel extends Equatable {
//   final String? data;
//   const MyRequestDetailsModel({this.data});

//   MyRequestDetailsModel copyWith({String? data}) {
//     return MyRequestDetailsModel(
//       data: data ?? this.data,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'data': data,
//     };
//   }

//   factory MyRequestDetailsModel.fromMap(Map<String, dynamic> map) {
//     return MyRequestDetailsModel(
//       data: map['data'] != null ? map['data'] as String : null,
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory MyRequestDetailsModel.fromJson(String source) =>
//       MyRequestDetailsModel.fromMap(
//         json.decode(source) as Map<String, dynamic>,
//       );

//   @override
//   bool get stringify => true;

//   @override
//   List<Object?> get props => [data];
// }
