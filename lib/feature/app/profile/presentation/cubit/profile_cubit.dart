import 'package:acm_online/feature/app/profile/data/repository/profile_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/models/result.dart';
import '../../../../../core/utils/status.dart';
import '../../data/model/profile_response_model.dart';

part 'profile_state.dart';

@injectable
class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this._repo) : super(const ProfileState());
  final ProfileRepo _repo;

  Future<void> getResources() async {
    emit(state.copyWith(profileState: Status.loading));

    final result = await _repo.getProfile();

    switch (result) {
      case ApiSuccessResult<ProfileResponseModel>():
        emit(
          state.copyWith(
            profileList: result.data,
            profileState: Status.success,
          ),
        );

      case ApiErrorResult<ProfileResponseModel>():
        emit(
          state.copyWith(
            profileError: result.failures.toString(),
            profileState: Status.error,
          ),
        );
    }
  }
}
