import 'package:acm_online/feature/app/leader_board/data/data_source/leader_data_source.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/exceptions/failures.dart';
import '../../../../../core/models/result.dart';
import '../model/leader_response_model.dart';


@injectable
class LeaderRepo {
  final LeaderDataSource _dataSource;
  LeaderRepo(this._dataSource);

  Future<ApiResult<LeaderResponseModel>> getLeaderScore() async {
    try {
      final response = await _dataSource.getLeaderScore();
      return ApiSuccessResult(response);
    } on DioException catch (errorMessage) {
      return ApiErrorResult(
        failures: ServerError(errorMessage: errorMessage.message ?? ''),
      );
    }
  }
}