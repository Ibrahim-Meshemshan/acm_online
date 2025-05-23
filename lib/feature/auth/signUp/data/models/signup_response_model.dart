// To parse this JSON data, use:
// final loginResponseModel = loginResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:acm_online/feature/auth/signUp/domain/entities/signup_entity.dart';


SignupResponseModel loginResponseModelFromJson(String str) =>
    SignupResponseModel.fromJson(json.decode(str));

String loginResponseModelToJson(SignupResponseModel data) =>
    json.encode(data.toJson());

class SignupResponseModel extends SignupResponseEntity {
  SignupResponseModel({
    required super.msg,
    required Signup super.data,
    required Token super.token,
  });

  factory SignupResponseModel.fromJson(Map<String, dynamic> json) =>
      SignupResponseModel(
        msg: json["msg"] ?? '',
        data: Signup.fromJson(json["data"]),
        token: Token.fromJson(json["token"]),
      );

  Map<String, dynamic> toJson() => {
    "msg": msg,
    "data": (data as Signup).toJson(),
    "token": (token as Token).toJson(),
  };
}

class Signup extends SignupEntity {
  Signup({
    required super.id,
    required super.firstname,
    required super.lastname,
    required super.email,
    required super.roleId,
    required super.profileStatus,
    required super.phoneNumber,
    required super.isVerified,
    required super.preferredLanguage,
    required super.preferredCurrency,
    required super.createdAt,
    required super.updatedAt,
    required super.logOutAt,
    required super.deletedAt,
    required Role super.role,
  });

  factory Signup.fromJson(Map<String, dynamic> json) => Signup(
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
    "role": (role as Role).toJson(),
  };
}

class Role extends RoleEntity {
  Role({
    required super.id,
    required super.name,
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

class Token extends TokenEntity {
  Token({
    required super.accessToken,
    required super.refreshToken,
  });

  factory Token.fromJson(Map<String, dynamic> json) => Token(
    accessToken: json["accessToken"],
    refreshToken: json["refreshToken"],
  );

  Map<String, dynamic> toJson() => {
    "accessToken": accessToken,
    "refreshToken": refreshToken,
  };
}
