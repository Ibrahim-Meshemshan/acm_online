import 'package:acm_online/feature/app/category/domain/entities/category_entity.dart';
import 'package:acm_online/feature/app/category/domain/repositories/category_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/models/result.dart';
import '../../../quiz_level/domain/entities/level_question_entity.dart';

@injectable
class CategoryUseCase {
  final CategoryRepo _repo;
  CategoryUseCase(this._repo);

  Future<ApiResult<List<CategoryEntity>>> call()async{
    return await _repo.fetchCategory();
  }
}