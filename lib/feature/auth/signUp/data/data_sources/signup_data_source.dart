// import 'package:acm_online/core/api_manager/api_manager.dart';
// import 'package:acm_online/core/models/result.dart';
// import 'package:acm_online/feature/auth/signUp/domain/entities/signup_entity.dart';
// import 'package:acm_online/feature/auth/signUp/domain/entities/signup_request_entity.dart';
// import 'package:injectable/injectable.dart';
//
// import '../../../../../core/api_manager/api_execute.dart';
//
// abstract class SignupDataSource {
//   Future<ApiResult<SignupResponseEntity>> signup(SignupRequestEntity request);
// }
//
// @Injectable(as: SignupDataSource)
// class SignupDataSourceImpl implements SignupDataSource {
//   RestClient apiClient;
//   SignupDataSourceImpl({required this.apiClient});
//   @override
//   Future<ApiResult<SignupResponseEntity>> signup(
//     SignupRequestEntity request,
//   ) async {
//     return ApiExecute.executeApi<SignupResponseEntity>(() async {
//       return await apiClient.signup({});
//     });
//   }
// }
