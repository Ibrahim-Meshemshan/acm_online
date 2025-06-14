import 'package:acm_online/core/models/result.dart';
import 'package:acm_online/feature/auth/signUp/data/data_sources/signup_data_source.dart';
import 'package:acm_online/feature/auth/signUp/domain/entities/signup_entity.dart';
import 'package:acm_online/feature/auth/signUp/domain/entities/signup_request_entity.dart';
import 'package:acm_online/feature/auth/signUp/domain/repositories/signup_repo.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';


// @Injectable(as: SignupRepo)
// class SignupRepoImpl implements SignupRepo {
//   SignupDataSource dataSource;
//   SignupRepoImpl({required this.dataSource});
//   @override
//   Future<ApiResult<SignupResponseEntity>> signup(SignupRequestEntity request) async{
//     try {
//       return await dataSource.signup(request);
//     } on DioException catch (ex) {
//       return ApiError(ClientError(errorModel: ex.response?.data));
//     }
//   }
//
// }