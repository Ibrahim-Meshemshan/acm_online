part of 'leader_cubit.dart';

class LeaderState {
  final Status leaderState;
  final String? leaderError;
  final LeaderResponseModel ? leaderList;

  const LeaderState({
    this.leaderState = Status.initial,
    this.leaderError,
    this.leaderList,
  });

  LeaderState copyWith({
    Status? leaderState,
    String? leaderError,
    LeaderResponseModel? leaderList,
  }) {
    return LeaderState(
      leaderState: leaderState ?? this.leaderState,
      leaderError: leaderError ?? this.leaderError,
      leaderList: leaderList ?? this.leaderList,
    );
  }
}


