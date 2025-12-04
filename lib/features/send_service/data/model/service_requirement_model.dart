import 'dart:convert';

class ServiceRequirementModel {
  final bool? isSuccess;
  final ServiceRequirementModelData? data;

  ServiceRequirementModel({this.isSuccess, this.data});

  ServiceRequirementModel copyWith({
    bool? isSuccess,
    ServiceRequirementModelData? data,
  }) => ServiceRequirementModel(
    isSuccess: isSuccess ?? this.isSuccess,
    data: data ?? this.data,
  );

  factory ServiceRequirementModel.fromJson(String str) =>
      ServiceRequirementModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ServiceRequirementModel.fromMap(Map<String, dynamic> json) =>
      ServiceRequirementModel(
        isSuccess: json["isSuccess"],
        data: json["data"] == null
            ? null
            : ServiceRequirementModelData.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
    "isSuccess": isSuccess,
    "data": data?.toMap(),
  };
}

class ServiceRequirementModelData {
  final int? id;
  final String? name;
  final String? description;
  final num? serviceAmount;
  final num? serviceFee;
  final num? tax;
  final String? applicationSteps;
  final int? branchId;
  final int? categoryId;
  final List<ServiceAttachmentType>? serviceAttachmentTypes;

  ServiceRequirementModelData({
    this.id,
    this.name,
    this.description,
    this.serviceAmount,
    this.serviceFee,
    this.tax,
    this.applicationSteps,
    this.branchId,
    this.categoryId,
    this.serviceAttachmentTypes,
  });

  ServiceRequirementModelData copyWith({
    int? id,
    String? name,
    String? description,
    int? serviceAmount,
    int? serviceFee,
    int? tax,
    String? applicationSteps,
    int? branchId,
    int? categoryId,
    List<ServiceAttachmentType>? serviceAttachmentTypes,
  }) => ServiceRequirementModelData(
    id: id ?? this.id,
    name: name ?? this.name,
    description: description ?? this.description,
    serviceAmount: serviceAmount ?? this.serviceAmount,
    serviceFee: serviceFee ?? this.serviceFee,
    tax: tax ?? this.tax,
    applicationSteps: applicationSteps ?? this.applicationSteps,
    branchId: branchId ?? this.branchId,
    categoryId: categoryId ?? this.categoryId,
    serviceAttachmentTypes:
        serviceAttachmentTypes ?? this.serviceAttachmentTypes,
  );

  factory ServiceRequirementModelData.fromJson(String str) =>
      ServiceRequirementModelData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ServiceRequirementModelData.fromMap(Map<String, dynamic> json) =>
      ServiceRequirementModelData(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        serviceAmount: json["serviceAmount"],
        serviceFee: json["serviceFee"],
        tax: json["tax"],
        applicationSteps: json["applicationSteps"],
        branchId: json["branchId"],
        categoryId: json["categoryId"],
        serviceAttachmentTypes: json["serviceAttachmentTypes"] == null
            ? []
            : List<ServiceAttachmentType>.from(
                json["serviceAttachmentTypes"]!.map(
                  (x) => ServiceAttachmentType.fromMap(x),
                ),
              ),
      );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "description": description,
    "serviceAmount": serviceAmount,
    "serviceFee": serviceFee,
    "tax": tax,
    "applicationSteps": applicationSteps,
    "branchId": branchId,
    "categoryId": categoryId,
    "serviceAttachmentTypes": serviceAttachmentTypes == null
        ? []
        : List<dynamic>.from(serviceAttachmentTypes!.map((x) => x.toMap())),
  };
}

class ServiceAttachmentType {
  final int? id;
  final String? name;

  ServiceAttachmentType({this.id, this.name});

  ServiceAttachmentType copyWith({int? id, String? name}) =>
      ServiceAttachmentType(id: id ?? this.id, name: name ?? this.name);

  factory ServiceAttachmentType.fromJson(String str) =>
      ServiceAttachmentType.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ServiceAttachmentType.fromMap(Map<String, dynamic> json) =>
      ServiceAttachmentType(id: json["id"], name: json["name"]);

  Map<String, dynamic> toMap() => {"id": id, "name": name};
}
