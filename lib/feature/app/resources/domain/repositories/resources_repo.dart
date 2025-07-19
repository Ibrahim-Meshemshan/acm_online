import 'package:acm_online/core/models/result.dart';

import '../entities/resources_response_entity.dart';

abstract class ResourcesRepo {
  Future<ApiResult<List<ResourcesEntity>>> fetchResources(String level);
}