
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

// Future<ResultsResponseModel> getResults() async{
//   final response = await ServerDio.dioInstance.get(
//     ApiConstant.leaderAndResults,
//     data: {
//       'userId': 1,
//       'categoryId': 6,
//       'subcategoryId':8,
//       'score': 77
//     }
//   );
//   return ResultsResponseModel.fromJson(response.data);
// }

}