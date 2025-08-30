class SignUpRequestEntity {
  SignUpRequestEntity({
    this.firstName,
    this.lastName,
    this.email,
    this.password,
  });

  String? firstName;
  String? lastName;
  String? email;
  String? password;

  // to json
  Map<String,dynamic> toJson(){
    return {
      'firstname': firstName,
      'lastname': lastName,
      'email': email,
      'password': password,
    };
  }
}
