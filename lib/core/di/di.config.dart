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
import '../../feature/app/category/presentation/cubit/category_cubit.dart'
    as _i413;
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
import '../../feature/auth/signUp/domain/repositories/signup_repo.dart'
    as _i363;
import '../../feature/auth/signUp/domain/use_cases/signup_use_case.dart'
    as _i680;
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
    gh.factory<_i680.SignupUseCase>(
      () => _i680.SignupUseCase(repo: gh<_i363.SignupRepo>()),
    );
    gh.singleton<_i361.Dio>(
      () => dioInjection.provideDIO(gh<_i361.LogInterceptor>()),
    );
    gh.singleton<_i266.RestClient>(
      () => dioInjection.provideWebServices(gh<_i361.Dio>()),
    );
    gh.factory<_i247.CategoryDataSource>(
      () => _i247.CategoryDataSourceImpl(gh<_i266.RestClient>()),
    );
    gh.factory<_i224.LevelQuestionDataSource>(
      () => _i224.LevelQuestionDataSourceImpl(gh<_i266.RestClient>()),
    );
    gh.factory<_i39.CategoryRepo>(
      () => _i349.CategoryRepoImpl(gh<_i247.CategoryDataSource>()),
    );
    gh.factory<_i1030.LevelQuestionRepo>(
      () => _i810.LevelQuestionRepoImpl(gh<_i224.LevelQuestionDataSource>()),
    );
    gh.factory<_i73.LevelQuestionUseCase>(
      () => _i73.LevelQuestionUseCase(gh<_i1030.LevelQuestionRepo>()),
    );
    gh.factory<_i618.LevelQuestionCubit>(
      () => _i618.LevelQuestionCubit(useCase: gh<_i73.LevelQuestionUseCase>()),
    );
    gh.factory<_i193.CategoryUseCase>(
      () => _i193.CategoryUseCase(gh<_i39.CategoryRepo>()),
    );
    gh.factory<_i413.CategoryCubit>(
      () => _i413.CategoryCubit(useCase: gh<_i193.CategoryUseCase>()),
    );
    return this;
  }
}

class _$DioInjection extends _i285.DioInjection {}
