import 'package:acm_online/feature/app/profile/data/data_source/profile_data_source.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/exceptions/failures.dart';
import '../../../../../core/models/result.dart';
import '../model/profile_response_model.dart';

@injectable
class ProfileRepo {
  final ProfileDataSource _dataSource;

  ProfileRepo(this._dataSource);

  Future<ApiResult<ProfileResponseModel>> getProfile() async {
    try {
      final response = await _dataSource.getProfile();
      return ApiSuccessResult(response);
    } on DioException catch (errorMessage) {
      return ApiErrorResult(
        failures: ServerError(errorMessage: errorMessage.message ?? ''),
      );
    }
  }
}
