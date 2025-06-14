import 'package:acm_online/feature/app/category/domain/entities/category_entity.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/api_manager/api_manager.dart';
import '../../../../../core/exceptions/failures.dart';
import '../../../../../core/models/result.dart';

abstract class CategoryDataSource {
  Future<ApiResult<List<CategoryEntity>>> fetchCategory();
}


@Injectable(as: CategoryDataSource)
class CategoryDataSourceImpl implements CategoryDataSource{

  final RestClient _apiClient;
  CategoryDataSourceImpl(this._apiClient);

  @override
  Future<ApiResult<List<CategoryEntity>>> fetchCategory() async{
    try {
      final responseCategory = await _apiClient.fetchCategory();
      print('Raw API response: ${responseCategory.toJson()}');
      return ApiSuccess(responseCategory.categoryList?.map((dto)=>dto.toCategoryEntity()).toList() ?? []);
    } on DioException catch (errorMessage) {
      return ApiError(failures: NetworkError(errorMessage: errorMessage.message ?? '',));
    }
  }

}