import 'package:acm_online/feature/app/category/domain/entities/sub_category_entity.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/models/result.dart';
import '../repositories/category_repo.dart';

@injectable
class SubCategoryUseCase {
  final CategoryRepo _repo;
  SubCategoryUseCase(this._repo);

  Future<ApiResult<List<SubCategoryEntity>>> call()async{
    return await _repo.fetchSubCategory();
  }
}