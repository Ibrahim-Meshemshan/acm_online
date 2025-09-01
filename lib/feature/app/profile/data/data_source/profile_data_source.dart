import 'package:acm_online/core/api_manager/api_constant.dart';
import 'package:acm_online/core/api_manager/server_dio.dart';
import 'package:acm_online/feature/app/profile/data/model/profile_response_model.dart';
import 'package:injectable/injectable.dart';

@singleton
class ProfileDataSource {


  Future<ProfileResponseModel> getProfile() async {
    final response = await ServerDio.dioInstance.get(
      ApiConstant.profile,
    );
    return ProfileResponseModel.fromJson(response.data);
  }
}