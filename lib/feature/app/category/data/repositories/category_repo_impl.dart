

import 'package:acm_online/feature/app/category/domain/entities/sub_category_entity.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/models/result.dart';
import '../../domain/entities/category_entity.dart';
import '../../domain/repositories/category_repo.dart';
import '../data_sources/category_data_source.dart';

@Injectable(as: CategoryRepo)
class CategoryRepoImpl implements  CategoryRepo {
  final CategoryDataSource _dataSource;
  CategoryRepoImpl(this._dataSource);

  @override
  Future<ApiResult<List<CategoryEntity>>> fetchCategory() async{
    return await _dataSource.fetchCategory();
  }

  @override
  Future<ApiResult<List<SubCategoryEntity>>> fetchSubCategory() async{
    return await _dataSource.fetchSubCategory();
  }


}
