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
import '../../feature/app/leader_board/data/data_source/leader_data_source.dart'
    as _i579;
import '../../feature/app/leader_board/data/repo/leader_repo.dart' as _i236;
import '../../feature/app/leader_board/presentation/cubit/leader_cubit.dart'
    as _i111;
import '../../feature/app/profile/data/data_source/profile_data_source.dart'
    as _i733;
import '../../feature/app/profile/data/repository/profile_repo.dart' as _i1024;
import '../../feature/app/profile/presentation/cubit/profile_cubit.dart'
    as _i331;
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
import '../../feature/app/resources/data/data_source/resources_data_source.dart'
    as _i765;
import '../../feature/app/resources/data/repository/resources_repository.dart'
    as _i238;
import '../../feature/app/resources/presentation/cubit/resources_cubit.dart'
    as _i867;
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
    gh.singleton<_i733.ProfileDataSource>(() => _i733.ProfileDataSource());
    gh.singleton<_i765.ResourcesDataSource>(() => _i765.ResourcesDataSource());
    gh.singleton<_i579.LeaderDataSource>(() => _i579.LeaderDataSource());
    gh.factory<_i555.CategoryRepository>(
      () => _i555.CategoryRepository(gh<_i247.CategoryDataSource>()),
    );
    gh.singleton<_i266.RestClient>(
      () => dioInjection.provideWebServices(gh<_i361.Dio>()),
    );
    gh.factory<_i1024.ProfileRepo>(
      () => _i1024.ProfileRepo(gh<_i733.ProfileDataSource>()),
    );
    gh.factory<_i236.LeaderRepo>(
      () => _i236.LeaderRepo(gh<_i579.LeaderDataSource>()),
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
    gh.factory<_i238.ResourcesRepository>(
      () => _i238.ResourcesRepository(gh<_i765.ResourcesDataSource>()),
    );
    gh.factory<_i707.SubCategoryCubit>(
      () => _i707.SubCategoryCubit(gh<_i555.CategoryRepository>()),
    );
    gh.factory<_i331.ProfileCubit>(
      () => _i331.ProfileCubit(gh<_i1024.ProfileRepo>()),
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
    gh.factory<_i111.LeaderCubit>(
      () => _i111.LeaderCubit(gh<_i236.LeaderRepo>()),
    );
    gh.factory<_i618.LevelQuestionCubit>(
      () => _i618.LevelQuestionCubit(useCase: gh<_i73.LevelQuestionUseCase>()),
    );
    gh.factory<_i867.ResourcesCubit>(
      () => _i867.ResourcesCubit(gh<_i238.ResourcesRepository>()),
    );
    return this;
  }
}

class _$DioInjection extends _i285.DioInjection {}
