
import 'package:acm_online/feature/app/leader_board/data/model/leader_response_model.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/api_manager/api_constant.dart';
import '../../../../../core/api_manager/server_dio.dart';

@singleton
class LeaderDataSource {
  Future<LeaderResponseModel> getLeaderScore() async {
    final response = await ServerDio.dioInstance.get(
      ApiConstant.leaderAndResults,
    );
    return LeaderResponseModel.fromJson(response.data);
  }
}