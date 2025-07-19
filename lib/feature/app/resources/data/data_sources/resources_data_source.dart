import 'package:acm_online/core/models/result.dart';
import 'package:acm_online/feature/app/resources/domain/entities/resources_response_entity.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/api_manager/api_manager.dart';
import '../../../../../core/exceptions/failures.dart';

abstract class ResourcesDataSource {
  Future<ApiResult<List<ResourcesEntity>>> fetchResources(String level);
}

@Injectable(as: ResourcesDataSource)
class ResourcesDataSourceImpl implements ResourcesDataSource{

  final RestClient _apiClient;
  ResourcesDataSourceImpl(this._apiClient);

  @override
  Future<ApiResult<List<ResourcesEntity>>> fetchResources(String level) async {
    try {
      final path = 'resources/$level'; // بناء المسار بشكل صحيح
      final response = await _apiClient.fetchResources(path);
      return ApiSuccess(response.data?.map((dto)=>dto.toEntity()).toList() ?? []);
    } on DioException catch (errorMessage) {
      return ApiError(failures: NetworkError(errorMessage: errorMessage.message ?? ''));
    }
  }

}