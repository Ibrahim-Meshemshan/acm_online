part of 'auth_cubit.dart';

class AuthState {
  final Status signUpState;
  final Status signInState;

  final String? signUpError;
  final String? signInError;
  final String? logoutError;
  final String? authMeError;

  final RegisterResponseModel? signupList;
  final LoginResponseModel? signInList;
  final Logout? logout;
  final AuthMeResponseModel? authMe;

  const AuthState({
    this.signUpState = Status.initial,
    this.signInState = Status.initial,
    this.logout,
    this.logoutError,
    this.authMeError,
    this.signUpError,
    this.signInError,
    this.authMe,
    this.signupList,
    this.signInList,
  });

  AuthState copyWith({
    Status? signUpState,
    Status? signInState,
    String? signUpError,
    String? signInError,
    String? logoutError,
    String? authMeError,
    RegisterResponseModel? signupList,
    LoginResponseModel? signInList,
    Logout? logout,
    AuthMeResponseModel? authMe,
  }) {
    return AuthState(
      signUpState: signUpState ?? this.signUpState,
      signInState: signInState ?? this.signInState,
      signUpError: signUpError ?? this.signUpError,
      signInError: signInError ?? this.signInError,
      logoutError: logoutError ?? this.logoutError,
      authMeError: authMeError ?? this.authMeError,
      signupList: signupList ?? this.signupList,
      signInList: signInList ?? this.signInList,
      logout: logout ?? this.logout,
      authMe: authMe ?? this.authMe,
    );
  }
}
