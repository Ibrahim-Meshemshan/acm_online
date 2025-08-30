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
import '../../feature/app/category/data/repositories/category_repository.dart'
    as _i555;
import '../../feature/app/category/presentation/cubit/category/category_cubit.dart'
    as _i1071;
import '../../feature/app/category/presentation/cubit/sub_category/sub_category_cubit.dart'
    as _i707;
import '../../feature/app/levels/data/data_source/resources_data_source.dart'
    as _i1058;
import '../../feature/app/levels/data/repository/resources_repository.dart'
    as _i1029;
import '../../feature/app/levels/presentation/cubit/resources_cubit.dart'
    as _i304;
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
import '../../feature/auth/data/data_sources/auth_data_source.dart' as _i812;
import '../../feature/auth/data/repositories/auth_repository.dart' as _i676;
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
    gh.factory<_i812.AuthDataSource>(() => _i812.AuthDataSource());
    gh.singleton<_i361.Dio>(() => dioInjection.provideDIO());
    gh.singleton<_i247.CategoryDataSource>(() => _i247.CategoryDataSource());
    gh.singleton<_i1058.ResourcesDataSource>(
      () => _i1058.ResourcesDataSource(),
    );
    gh.factory<_i555.CategoryRepository>(
      () => _i555.CategoryRepository(gh<_i247.CategoryDataSource>()),
    );
    gh.singleton<_i266.RestClient>(
      () => dioInjection.provideWebServices(gh<_i361.Dio>()),
    );
    gh.factory<_i1029.ResourcesRepository>(
      () => _i1029.ResourcesRepository(gh<_i1058.ResourcesDataSource>()),
    );
    gh.factory<_i676.AuthRepository>(
      () => _i676.AuthRepository(gh<_i812.AuthDataSource>()),
    );
    gh.factory<_i1071.CategoryCubit>(
      () => _i1071.CategoryCubit(gh<_i555.CategoryRepository>()),
    );
    gh.factory<_i224.LevelQuestionDataSource>(
      () => _i224.LevelQuestionDataSourceImpl(gh<_i266.RestClient>()),
    );
    gh.factory<_i304.ResourcesCubit>(
      () => _i304.ResourcesCubit(gh<_i1029.ResourcesRepository>()),
    );
    gh.factory<_i707.SubCategoryCubit>(
      () => _i707.SubCategoryCubit(gh<_i555.CategoryRepository>()),
    );
    gh.factory<_i1030.LevelQuestionRepo>(
      () => _i810.LevelQuestionRepoImpl(gh<_i224.LevelQuestionDataSource>()),
    );
    gh.factory<_i47.AuthCubit>(
      () => _i47.AuthCubit(gh<_i676.AuthRepository>()),
    );
    gh.factory<_i73.LevelQuestionUseCase>(
      () => _i73.LevelQuestionUseCase(gh<_i1030.LevelQuestionRepo>()),
    );
    gh.factory<_i618.LevelQuestionCubit>(
      () => _i618.LevelQuestionCubit(useCase: gh<_i73.LevelQuestionUseCase>()),
    );
    return this;
  }
}

class _$DioInjection extends _i285.DioInjection {}
