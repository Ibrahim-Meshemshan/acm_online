
// abstract class CategoryDataSource {
//   Future<ApiResult<List<CategoryEntity>>> fetchCategory();
//   Future<ApiResult<List<SubCategoryEntity>>> fetchSubCategory();
// }
//
//
// @Injectable(as: CategoryDataSource)
// class CategoryDataSourceImpl implements CategoryDataSource{
//
//   final RestClient _apiClient;
//   CategoryDataSourceImpl(this._apiClient);
//
//   @override
//   Future<ApiResult<List<CategoryEntity>>> fetchCategory() async{
//     try {
//       final responseCategory = await _apiClient.fetchCategory();
//       print("category is: ${responseCategory.categoryList}");
//       return ApiSuccessResult(responseCategory.categoryList?.map((dto)=>dto.toCategoryEntity()).toList() ?? []);
//     } on DioException catch (errorMessage) {
//       return ApiErrorResult(failures: NetworkError(errorMessage: errorMessage.message ?? '',));
//     }
//   }
//
//   @override
//   Future<ApiResult<List<SubCategoryEntity>>> fetchSubCategory() async{
//     try {
//       final subCategoryResponse = await _apiClient.fetchSubCategory();
//       final response = subCategoryResponse.data?.map((dto)=>dto.toSubCategoryEntity()).toList() ?? [];
//       print('Raw response body: $response');
//       return ApiSuccessResult(response);
//     } on DioException catch (errorMessage) {
//       return ApiErrorResult(failures: NetworkError(errorMessage: errorMessage.message ?? '',));
//     }
//   }
//
// }
import 'package:acm_online/feature/app/category/data/models/category_response_model.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/api_manager/api_constant.dart';
import '../../../../../core/api_manager/server_dio.dart';
import '../models/sub_category_response_model.dart';


@singleton
class CategoryDataSource {

  Future<CategoryResponseModel> getCategories() async{
    final response = await ServerDio.dioInstance.get(
        ApiConstant.category,
    );
    return CategoryResponseModel.fromJson(response.data);
  }


  Future<SubCategoryResponseModel> getSubCategory() async{
    final response = await ServerDio.dioInstance.get(
      ApiConstant.subCategory,
    );
    return SubCategoryResponseModel.fromJson(response.data);
  }


}