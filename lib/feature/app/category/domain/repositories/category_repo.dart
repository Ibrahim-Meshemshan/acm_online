import 'package:acm_online/core/models/result.dart';
import 'package:acm_online/feature/app/category/domain/entities/category_entity.dart';

abstract class CategoryRepo {
  Future<ApiResult<List<CategoryEntity>>> fetchCategory();
}