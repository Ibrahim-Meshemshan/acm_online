// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../feature/app/category/data/data_sources/category_data_source.dart'
    as _i247;
import '../../feature/app/category/data/repositories/category_repo_impl.dart'
    as _i349;
import '../../feature/app/category/domain/repositories/category_repo.dart'
    as _i39;
import '../../feature/app/category/domain/use_cases/category_use_case.dart'
    as _i193;
import '../../feature/app/category/domain/use_cases/sub_category_use_case.dart'
    as _i1048;
import '../../feature/app/category/presentation/cubit/category/category_cubit.dart'
    as _i1071;
import '../../feature/app/category/presentation/cubit/sub_category/sub_category_cubit.dart'
    as _i707;
import '../../feature/app/quiz_level/data/data_sources/level_question_data_source.dart'
    as _i224;
import '../../feature/app/quiz_level/data/repositories/level_question_repo_impl.dart'
    as _i810;
import '../../feature/app/quiz_level/domain/repositories/level_question_repo.dart'
    as _i1030;
import '../../feature/app/quiz_level/domain/use_cases/level_question_use_case.dart'
    as _i73;
import '../../feature/app/quiz_level/presentation/cubit/level_question_cubit.dart'
    as _i618;
import '../../feature/app/resources/data/data_sources/resources_data_source.dart'
    as _i458;
import '../../feature/app/resources/data/repositories/resources_repo_impl.dart'
    as _i527;
import '../../feature/app/resources/domain/repositories/resources_repo.dart'
    as _i242;
import '../../feature/app/resources/domain/use_cases/resources_use_case.dart'
    as _i631;
import '../../feature/auth/data/data_sources/auth_data_source.dart' as _i812;
import '../../feature/auth/data/repositories/auth_repo_impl.dart' as _i1011;
import '../../feature/auth/domain/repositories/auth_repo.dart' as _i654;
import '../../feature/auth/domain/use_cases/signin_use_case.dart' as _i1017;
import '../../feature/auth/domain/use_cases/signup_use_case.dart' as _i20;
import '../../feature/auth/presentation/cubit/auth_cubit.dart' as _i47;
import '../api_manager/api_di.dart' as _i285;
import '../api_manager/api_manager.dart' as _i266;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioInjection = _$DioInjection();
    gh.singleton<_i361.LogInterceptor>(() => dioInjection.provideLogger());
    gh.singleton<_i361.Dio>(
      () => dioInjection.provideDIO(gh<_i361.LogInterceptor>()),
    );
    gh.singleton<_i266.RestClient>(
      () => dioInjection.provideWebServices(gh<_i361.Dio>()),
    );
    gh.factory<_i247.CategoryDataSource>(
      () => _i247.CategoryDataSourceImpl(gh<_i266.RestClient>()),
    );
    gh.factory<_i812.AuthDataSource>(
      () => _i812.AuthDataSourceImpl(gh<_i266.RestClient>()),
    );
    gh.factory<_i654.AuthRepo>(
      () => _i1011.AuthRepoImpl(gh<_i812.AuthDataSource>()),
    );
    gh.factory<_i224.LevelQuestionDataSource>(
      () => _i224.LevelQuestionDataSourceImpl(gh<_i266.RestClient>()),
    );
    gh.factory<_i458.ResourcesDataSource>(
      () => _i458.ResourcesDataSourceImpl(gh<_i266.RestClient>()),
    );
    gh.factory<_i39.CategoryRepo>(
      () => _i349.CategoryRepoImpl(gh<_i247.CategoryDataSource>()),
    );
    gh.factory<_i1030.LevelQuestionRepo>(
      () => _i810.LevelQuestionRepoImpl(gh<_i224.LevelQuestionDataSource>()),
    );
    gh.factory<_i1017.SignInUseCase>(
      () => _i1017.SignInUseCase(repo: gh<_i654.AuthRepo>()),
    );
    gh.factory<_i20.SignupUseCase>(
      () => _i20.SignupUseCase(repo: gh<_i654.AuthRepo>()),
    );
    gh.factory<_i73.LevelQuestionUseCase>(
      () => _i73.LevelQuestionUseCase(gh<_i1030.LevelQuestionRepo>()),
    );
    gh.factory<_i47.AuthCubit>(
      () => _i47.AuthCubit(
        signupUseCase: gh<_i20.SignupUseCase>(),
        signInUseCase: gh<_i1017.SignInUseCase>(),
      ),
    );
    gh.factory<_i242.ResourcesRepo>(
      () => _i527.ResourcesRepoImpl(gh<_i458.ResourcesDataSource>()),
    );
    gh.factory<_i193.CategoryUseCase>(
      () => _i193.CategoryUseCase(gh<_i39.CategoryRepo>()),
    );
    gh.factory<_i1048.SubCategoryUseCase>(
      () => _i1048.SubCategoryUseCase(gh<_i39.CategoryRepo>()),
    );
    gh.factory<_i631.ResourcesUseCase>(
      () => _i631.ResourcesUseCase(repo: gh<_i242.ResourcesRepo>()),
    );
    gh.factory<_i707.SubCategoryCubit>(
      () => _i707.SubCategoryCubit(useCase: gh<_i1048.SubCategoryUseCase>()),
    );
    gh.factory<_i1071.CategoryCubit>(
      () => _i1071.CategoryCubit(useCase: gh<_i193.CategoryUseCase>()),
    );
    gh.factory<_i618.LevelQuestionCubit>(
      () => _i618.LevelQuestionCubit(
        useCase: gh<_i73.LevelQuestionUseCase>(),
        resourcesUseCase: gh<_i631.ResourcesUseCase>(),
      ),
    );
    return this;
  }
}

class _$DioInjection extends _i285.DioInjection {}
