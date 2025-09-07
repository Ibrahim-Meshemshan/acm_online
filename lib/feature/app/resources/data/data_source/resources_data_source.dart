
import 'package:injectable/injectable.dart';

import '../../../../../core/api_manager/api_constant.dart';
import '../../../../../core/api_manager/server_dio.dart';
import '../model/resources_response_model.dart';
import '../model/results_request_model.dart';
import '../model/results_response_model.dart';

@singleton
class ResourcesDataSource {
  Future<ResourcesResponseModel> getResources() async{
    final response = await ServerDio.dioInstance.get(
      ApiConstant.levels,
    );
    return ResourcesResponseModel.fromJson(response.data);
  }

Future<ResultsResponseModel> getResults(ResultsRequestModel request) async{
    var json = request.toJson();
  final response = await ServerDio.dioInstance.get(
    ApiConstant.leaderAndResults,
    data: json,
  );
  return ResultsResponseModel.fromJson(response.data);
}

}