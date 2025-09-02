// To parse this JSON data, do
//
//     final authMeResponseModel = authMeResponseModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

AuthMeResponseModel authMeResponseModelFromJson(String str) => AuthMeResponseModel.fromJson(json.decode(str));

String authMeResponseModelToJson(AuthMeResponseModel data) => json.encode(data.toJson());

class AuthMeResponseModel {
  int id;
  String firstname;
  String lastname;
  String email;
  int roleId;
  String profileStatus;
  dynamic phoneNumber;
  bool isVerified;
  String preferredLanguage;
  String preferredCurrency;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic logOutAt;
  dynamic deletedAt;
  String level;
  Role role;

  AuthMeResponseModel({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.roleId,
    required this.profileStatus,
    required this.phoneNumber,
    required this.isVerified,
    required this.preferredLanguage,
    required this.preferredCurrency,
    required this.createdAt,
    required this.updatedAt,
    required this.logOutAt,
    required this.deletedAt,
    required this.level,
    required this.role,
  });

  factory AuthMeResponseModel.fromJson(Map<String, dynamic> json) => AuthMeResponseModel(
    id: json["id"],
    firstname: json["firstname"],
    lastname: json["lastname"],
    email: json["email"],
    roleId: json["role_id"],
    profileStatus: json["profile_status"],
    phoneNumber: json["phone_number"],
    isVerified: json["is_verified"],
    preferredLanguage: json["preferred_language"],
    preferredCurrency: json["preferred_currency"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    logOutAt: json["log_out_at"],
    deletedAt: json["deletedAt"],
    level: json["level"],
    role: Role.fromJson(json["role"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "firstname": firstname,
    "lastname": lastname,
    "email": email,
    "role_id": roleId,
    "profile_status": profileStatus,
    "phone_number": phoneNumber,
    "is_verified": isVerified,
    "preferred_language": preferredLanguage,
    "preferred_currency": preferredCurrency,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "log_out_at": logOutAt,
    "deletedAt": deletedAt,
    "level": level,
    "role": role.toJson(),
  };
}

class Role {
  int id;
  String name;

  Role({
    required this.id,
    required this.name,
  });

  factory Role.fromJson(Map<String, dynamic> json) => Role(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
