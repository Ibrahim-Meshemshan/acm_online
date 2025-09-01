part of 'profile_cubit.dart';

class ProfileState {

  final Status profileState;
  final String? profileError;
  final ProfileResponseModel ? profileList;

  const ProfileState({
    this.profileState = Status.initial,
    this.profileError,
    this.profileList,
  });


  ProfileState copyWith({
    Status? profileState,
    String? profileError,
    ProfileResponseModel? profileList,
  }) {
    return ProfileState(
      profileState: profileState ?? this.profileState,
      profileError: profileError ?? this.profileError,
      profileList: profileList ?? this.profileList,
    );
  }

}


