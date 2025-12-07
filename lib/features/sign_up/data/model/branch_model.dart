import 'dart:convert';

class BranchModel {
  final int? id;
  final String? name;

  BranchModel({this.id, this.name});

  BranchModel copyWith({int? id, String? name}) =>
      BranchModel(id: id ?? this.id, name: name ?? this.name);

  factory BranchModel.fromJson(String str) =>
      BranchModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BranchModel.fromMap(Map<String, dynamic> json) =>
      BranchModel(id: json["id"], name: json["name"]);

  Map<String, dynamic> toMap() => {"id": id, "name": name};
}
