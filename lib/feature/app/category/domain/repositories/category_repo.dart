import 'package:acm_online/core/models/result.dart';
import 'package:acm_online/feature/app/category/domain/entities/category_entity.dart';

import '../entities/sub_category_entity.dart';

abstract class CategoryRepo {
  Future<ApiResult<List<CategoryEntity>>> fetchCategory();
  Future<ApiResult<List<SubCategoryEntity>>> fetchSubCategory();
}