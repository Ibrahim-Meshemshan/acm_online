import 'package:injectable/injectable.dart';

import '../../../../../core/models/result.dart';
import '../../domain/entities/resources_response_entity.dart';
import '../../domain/repositories/resources_repo.dart';
import '../data_sources/resources_data_source.dart';

@Injectable(as: ResourcesRepo)
class ResourcesRepoImpl implements ResourcesRepo {
  final ResourcesDataSource _dataSource;

  ResourcesRepoImpl(this._dataSource);

  @override
  Future<ApiResult<List<ResourcesEntity>>> fetchResources(String level) {
    return _dataSource.fetchResources(level);
  }
}
