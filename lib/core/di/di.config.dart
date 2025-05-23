// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../feature/auth/signUp/data/data_sources/signup_data_source.dart'
    as _i125;
import '../../feature/auth/signUp/data/repositories/signup_repo_impl.dart'
    as _i489;
import '../../feature/auth/signUp/domain/repositories/signup_repo.dart'
    as _i363;
import '../../feature/auth/signUp/domain/use_cases/signup_use_case.dart'
    as _i680;
import '../../feature/auth/signUp/presentation/cubit/signup_cubit.dart'
    as _i496;
import '../api_manager/api_manager.dart' as _i266;
import 'di.dart' as _i913;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final appModule = _$AppModule();
    gh.factory<String>(() => appModule.resetCode, instanceName: 'resetCode');
    gh.factory<_i125.SignupDataSource>(
      () => _i125.SignupDataSourceImpl(apiClient: gh<_i266.RestClient>()),
    );
    gh.factory<_i363.SignupRepo>(
      () => _i489.SignupRepoImpl(dataSource: gh<_i125.SignupDataSource>()),
    );
    gh.factory<_i680.SignupUseCase>(
      () => _i680.SignupUseCase(repo: gh<_i363.SignupRepo>()),
    );
    gh.factory<_i496.SignupCubit>(
      () => _i496.SignupCubit(signupUseCase: gh<_i680.SignupUseCase>()),
    );
    return this;
  }
}

class _$AppModule extends _i913.AppModule {}
