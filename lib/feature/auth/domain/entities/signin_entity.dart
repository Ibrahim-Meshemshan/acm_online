import 'package:json_annotation/json_annotation.dart';


class SignInResponseEntity {
  String? msg;
  TokenEntity? token;

  SignInResponseEntity({this.msg, this.token});


}

@JsonSerializable()
class TokenEntity {
  String? accessToken;
  String? refreshToken;

  TokenEntity({this.accessToken, this.refreshToken});

}

