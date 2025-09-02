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