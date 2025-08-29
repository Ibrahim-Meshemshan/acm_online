import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/signup_entity.dart';

part 'signup_response_dto.g.dart';

@JsonSerializable()
class SignupResponseDto {
  String? msg;
  SignupDto? data;
  TokenDto? token;

  SignupResponseDto({this.msg, this.data, this.token});

  SignupResponseEntity toEntity() {
    return SignupResponseEntity(
      msg: msg,
      data: data?.toEntity(),
      token: token?.toEntity(),
    );
  }

  factory SignupResponseDto.fromJson(Map<String, dynamic> json) =>
      _$SignupResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SignupResponseDtoToJson(this);
}

@JsonSerializable()
class TokenDto {
  String? accessToken;
  String? refreshToken;

  TokenDto({this.accessToken, this.refreshToken});

  TokenEntity toEntity() {
    return TokenEntity(accessToken: accessToken, refreshToken: refreshToken);
  }

  factory TokenDto.fromJson(Map<String, dynamic> json) =>
      _$TokenDtoFromJson(json);

  Map<String, dynamic> toJson() => _$TokenDtoToJson(this);
}

@JsonSerializable()
class SignupDto {
  int? id;
  String? firstname;
  String? lastname;
  String? email;
  num? role_id;
  String? profile_status;
  dynamic phone_number;
  bool? is_verified;
  String? preferred_language;
  String? preferred_currency;
  dynamic log_out_at;
  dynamic deletedAt;
  dynamic level;
  RoleBean? role;

  SignupDto({
    this.id,
    this.firstname,
    this.lastname,
    this.email,
    this.role_id,
    this.profile_status,
    this.phone_number,
    this.is_verified,
    this.preferred_language,
    this.preferred_currency,
    this.log_out_at,
    this.deletedAt,
    this.level,
    this.role,
  });

  SignupEntity toEntity() {
    return SignupEntity(
      id: id,
      firstname: firstname,
      lastname: lastname,
      email: email,
    );
  }

  factory SignupDto.fromJson(Map<String, dynamic> json) =>
      _$SignupDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SignupDtoToJson(this);
}

@JsonSerializable()
class RoleBean {
  num? id;
  String? name;

  RoleBean({this.id, this.name});

  factory RoleBean.fromJson(Map<String, dynamic> json) =>
      _$RoleBeanFromJson(json);

  Map<String, dynamic> toJson() => _$RoleBeanToJson(this);
}
