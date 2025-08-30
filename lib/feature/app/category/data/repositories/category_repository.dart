import 'package:acm_online/feature/app/category/data/models/category_response_model.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/exceptions/failures.dart';
import '../../../../../core/models/result.dart';
import '../data_sources/category_data_source.dart';
import '../models/sub_category_response_model.dart';

@injectable
class CategoryRepository {
  CategoryRepository(this._dataSource);
  final CategoryDataSource _dataSource;


  Future<ApiResult<CategoryResponseModel>> getCategories() async{
    try {
      final response = await _dataSource.getCategories();
      return ApiSuccessResult(response);
    } on DioException catch (errorMessage) {
      return ApiErrorResult(
        failures: ServerError(errorMessage: errorMessage.message ?? ''),
      );
    }
  }


  Future<ApiResult<SubCategoryResponseModel>> getSubCategory() async{
    try {
      final response = await _dataSource.getSubCategory();
      return ApiSuccessResult(response);
    } on DioException catch (errorMessage) {
      return ApiErrorResult(
        failures: ServerError(errorMessage: errorMessage.message ?? ''),
      );
    }
  }


}
