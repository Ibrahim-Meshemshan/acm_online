// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signin_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignInResponseDto _$SignInResponseDtoFromJson(Map<String, dynamic> json) =>
    SignInResponseDto(
      msg: json['msg'] as String?,
      token:
          json['token'] == null
              ? null
              : TokenDto.fromJson(json['token'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SignInResponseDtoToJson(SignInResponseDto instance) =>
    <String, dynamic>{'msg': instance.msg, 'token': instance.token};

TokenDto _$TokenDtoFromJson(Map<String, dynamic> json) => TokenDto(
  accessToken: json['accessToken'] as String?,
  refreshToken: json['refreshToken'] as String?,
);

Map<String, dynamic> _$TokenDtoToJson(TokenDto instance) => <String, dynamic>{
  'accessToken': instance.accessToken,
  'refreshToken': instance.refreshToken,
};
