
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/exceptions/failures.dart';
import '../../../../../core/models/result.dart';
import '../data_source/resources_data_source.dart';
import '../model/resources_response_model.dart';

@injectable
class ResourcesRepository {
  final ResourcesDataSource _dataSource;
  ResourcesRepository(this._dataSource);

  Future<ApiResult<ResourcesResponseModel>> getResources() async{
    try {
      final response = await _dataSource.getResources();
      return ApiSuccessResult(response);
    } on DioException catch (errorMessage) {
      return ApiErrorResult(
        failures: ServerError(errorMessage: errorMessage.message ?? ''),
      );
    }
  }
}