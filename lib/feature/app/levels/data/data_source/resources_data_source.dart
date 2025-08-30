
import 'package:injectable/injectable.dart';

import '../../../../../core/api_manager/api_constant.dart';
import '../../../../../core/api_manager/server_dio.dart';
import '../model/resources_response_model.dart';

@singleton
class ResourcesDataSource {
  Future<ResourcesResponseModel> getResources() async{
    final response = await ServerDio.dioInstance.get(
      ApiConstant.levels,
    );
    return ResourcesResponseModel.fromJson(response.data);
  }

}