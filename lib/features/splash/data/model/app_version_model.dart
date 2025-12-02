// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UpdateAppModel {
  String? androidFullVersion;
  String? iosFullVersion;
  String? iosLink;
  String? androidLink;
  UpdateAppModel({
    this.androidFullVersion,
    this.iosFullVersion,
    this.iosLink,
    this.androidLink,
  });

  UpdateAppModel copyWith({
    String? appFullVersion,
    String? iosLink,
    String? androidLink,
    String? iosFullVersion,
  }) {
    return UpdateAppModel(
      androidFullVersion: appFullVersion ?? androidFullVersion,
      iosFullVersion: iosFullVersion ?? this.iosFullVersion,
      iosLink: iosLink ?? this.iosLink,
      androidLink: androidLink ?? this.androidLink,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'appFullVersion': androidFullVersion,
      'iosFullVersion': iosFullVersion,
      'iosLink': iosLink,
      'androidLink': androidLink,
    };
  }

  factory UpdateAppModel.fromMap(Map<String, dynamic> map) {
    return UpdateAppModel(
      androidFullVersion: map['appFullVersion'] != null
          ? map['appFullVersion'] as String
          : null,
      iosFullVersion: map['iosFullVersion'] != null
          ? map['iosFullVersion'] as String
          : null,
      iosLink: map['iosLink'] != null ? map['iosLink'] as String : null,
      androidLink:
          map['androidLink'] != null ? map['androidLink'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UpdateAppModel.fromJson(String source) =>
      UpdateAppModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'UpdateAppModel(androidFullVersion: $androidFullVersion, iosFullVersion: $iosFullVersion, iosLink: $iosLink, androidLink: $androidLink)';

  @override
  bool operator ==(covariant UpdateAppModel other) {
    if (identical(this, other)) return true;

    return other.androidFullVersion == androidFullVersion &&
        other.iosFullVersion == iosFullVersion &&
        other.iosLink == iosLink &&
        other.androidLink == androidLink;
  }

  @override
  int get hashCode =>
      androidFullVersion.hashCode ^
      iosFullVersion.hashCode ^
      iosLink.hashCode ^
      androidLink.hashCode;
}
