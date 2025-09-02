import 'package:acm_online/feature/app/leader_board/data/model/leader_response_model.dart';
import 'package:acm_online/feature/app/leader_board/data/repo/leader_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../../core/models/result.dart';
import '../../../../../core/utils/status.dart';

part 'leader_state.dart';

@injectable
class LeaderCubit extends Cubit<LeaderState> {
  LeaderCubit(this._repo) : super(const LeaderState());

  final LeaderRepo _repo;

  Future<void> getLeaderScore() async {
    emit(state.copyWith(leaderState: Status.loading));

    final result = await _repo.getLeaderScore();

    switch (result) {
      case ApiSuccessResult<LeaderResponseModel>():
        emit(
          state.copyWith(leaderList: result.data, leaderState: Status.success),
        );

      case ApiErrorResult<LeaderResponseModel>():
        emit(
          state.copyWith(
            leaderError: result.failures.toString(),
            leaderState: Status.error,
          ),
        );
    }
  }
}
