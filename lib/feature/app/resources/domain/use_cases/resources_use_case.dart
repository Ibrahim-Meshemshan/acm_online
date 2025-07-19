import 'package:acm_online/core/models/result.dart';
import 'package:acm_online/feature/app/resources/domain/repositories/resources_repo.dart';
import 'package:injectable/injectable.dart';

import '../entities/resources_response_entity.dart';

@injectable
class ResourcesUseCase {
  ResourcesRepo repo;

  ResourcesUseCase({required this.repo});

  Future<ApiResult<List<ResourcesEntity>>> call(String level) async {
    return await repo.fetchResources(level);
  }
}
