

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
  Future<ApiResult<List<CategoryEntity>>> fetchCategory() {
    return _dataSource.fetchCategory();
  }


}
