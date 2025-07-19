part of 'auth_cubit.dart';

class AuthState {
  final Status signUpState;
  final Status signInState;

  final String? signUpError;
  final String? signInError;

  final SignupResponseEntity? signupList;
  final SignInResponseEntity? signInList;

  const AuthState({
    this.signUpState = Status.initial,
    this.signInState = Status.initial,
    this.signUpError,
    this.signInError,
    this.signupList,
    this.signInList,
  });

  AuthState copyWith({
    Status? signUpState,
    Status? signInState,
    String? signUpError,
    String? signInError,
    SignupResponseEntity? signupList,
    SignInResponseEntity? signInList,
  }) {
    return AuthState(
      signUpState: signUpState ?? this.signUpState,
      signInState: signInState ?? this.signInState,
      signUpError: signUpError ?? this.signUpError,
      signInError: signInError ?? this.signInError,
      signupList: signupList ?? this.signupList,
      signInList: signInList ?? this.signInList,
    );
  }
}
