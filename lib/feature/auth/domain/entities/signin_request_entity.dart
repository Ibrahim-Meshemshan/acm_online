class SignInRequestEntity {
  String email;
  String password;

  SignInRequestEntity({required this.email, required this.password});





  // to json

  Map<String,dynamic> toJson(){
    return {
      'email': email,
      'password': password,
    };
  }


}
