// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignupResponseDto _$SignupResponseDtoFromJson(Map<String, dynamic> json) =>
    SignupResponseDto(
      msg: json['msg'] as String?,
      data:
          json['data'] == null
              ? null
              : SignupDto.fromJson(json['data'] as Map<String, dynamic>),
      token:
          json['token'] == null
              ? null
              : TokenDto.fromJson(json['token'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SignupResponseDtoToJson(SignupResponseDto instance) =>
    <String, dynamic>{
      'msg': instance.msg,
      'data': instance.data,
      'token': instance.token,
    };

TokenDto _$TokenDtoFromJson(Map<String, dynamic> json) => TokenDto(
  accessToken: json['accessToken'] as String?,
  refreshToken: json['refreshToken'] as String?,
);

Map<String, dynamic> _$TokenDtoToJson(TokenDto instance) => <String, dynamic>{
  'accessToken': instance.accessToken,
  'refreshToken': instance.refreshToken,
};

SignupDto _$SignupDtoFromJson(Map<String, dynamic> json) => SignupDto(
  id: (json['id'] as num?)?.toInt(),
  firstname: json['firstname'] as String?,
  lastname: json['lastname'] as String?,
  email: json['email'] as String?,
  role_id: json['role_id'] as num?,
  profile_status: json['profile_status'] as String?,
  phone_number: json['phone_number'],
  is_verified: json['is_verified'] as bool?,
  preferred_language: json['preferred_language'] as String?,
  preferred_currency: json['preferred_currency'] as String?,
  log_out_at: json['log_out_at'],
  deletedAt: json['deletedAt'],
  level: json['level'],
  role:
      json['role'] == null
          ? null
          : RoleBean.fromJson(json['role'] as Map<String, dynamic>),
);

Map<String, dynamic> _$SignupDtoToJson(SignupDto instance) => <String, dynamic>{
  'id': instance.id,
  'firstname': instance.firstname,
  'lastname': instance.lastname,
  'email': instance.email,
  'role_id': instance.role_id,
  'profile_status': instance.profile_status,
  'phone_number': instance.phone_number,
  'is_verified': instance.is_verified,
  'preferred_language': instance.preferred_language,
  'preferred_currency': instance.preferred_currency,
  'log_out_at': instance.log_out_at,
  'deletedAt': instance.deletedAt,
  'level': instance.level,
  'role': instance.role,
};

RoleBean _$RoleBeanFromJson(Map<String, dynamic> json) =>
    RoleBean(id: json['id'] as num?, name: json['name'] as String?);

Map<String, dynamic> _$RoleBeanToJson(RoleBean instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
};
