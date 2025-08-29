import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/signin_entity.dart';

part 'signin_response_dto.g.dart';

@JsonSerializable()
class SignInResponseDto {
  String? msg;
  TokenDto? token;

  SignInResponseDto({this.msg, this.token});

  SignInResponseEntity toSignInResponseEntity(){
    return SignInResponseEntity(
      msg: msg,
      token: token?.toTokenEntity(),
    );
  }

  factory SignInResponseDto.fromJson(Map<String, dynamic> json) => _$SignInResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SignInResponseDtoToJson(this);
}

@JsonSerializable()
class TokenDto {
  String? accessToken;
  String? refreshToken;

  TokenDto({this.accessToken, this.refreshToken});
  TokenEntity toTokenEntity(){
    return TokenEntity(
      refreshToken: refreshToken,
      accessToken: accessToken
    );
  }



  factory TokenDto.fromJson(Map<String, dynamic> json) => _$TokenDtoFromJson(json);

  Map<String, dynamic> toJson() => _$TokenDtoToJson(this);
}

