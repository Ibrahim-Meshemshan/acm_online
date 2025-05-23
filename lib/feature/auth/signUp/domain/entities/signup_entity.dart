class SignupResponseEntity {
  final String msg;
  final SignupEntity data;
  final TokenEntity token;

  SignupResponseEntity({
    required this.msg,
    required this.data,
    required this.token,
  });
}

class SignupEntity {
  final int id;
  final String firstname;
  final String lastname;
  final String email;
  final int roleId;
  final String profileStatus;
  final dynamic phoneNumber;
  final bool isVerified;
  final String preferredLanguage;
  final String preferredCurrency;
  final DateTime createdAt;
  final DateTime updatedAt;
  final dynamic logOutAt;
  final dynamic deletedAt;
  final RoleEntity role;

  SignupEntity({
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
    required this.role,
  });
}

class RoleEntity {
  final int id;
  final String name;

  RoleEntity({required this.id, required this.name});
}

class TokenEntity {
  final String accessToken;
  final String refreshToken;

  TokenEntity({required this.accessToken, required this.refreshToken});
}
