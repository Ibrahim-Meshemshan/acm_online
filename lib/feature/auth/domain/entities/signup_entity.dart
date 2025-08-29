class SignupResponseEntity {
  String? msg;
  SignupEntity? data;
  TokenEntity? token;

  SignupResponseEntity({this.msg, this.data, this.token});

}


class TokenEntity {
  String? accessToken;
  String? refreshToken;

  TokenEntity({this.accessToken, this.refreshToken});


}


class SignupEntity {
  num? id;
  String? firstname;
  String? lastname;
  String? email;


  SignupEntity({this.id, this.firstname, this.lastname, this.email});
}


