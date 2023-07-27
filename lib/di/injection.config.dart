// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:training_example/features/authentication/blocs/auth_bloc.dart'
    as _i5;
import 'package:training_example/models/user_info/bloc/user_info_bloc.dart'
    as _i6;
import 'package:training_example/repositories/auth_repository.dart' as _i3;
import 'package:training_example/repositories/user_repository.dart' as _i4;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.AuthRepository>(_i3.AuthRepository());
    gh.singleton<_i4.UserRepository>(_i4.UserRepository());
    gh.singleton<_i5.AuthBloc>(
        _i5.AuthBloc(authRepository: gh<_i3.AuthRepository>()));
    gh.singleton<_i6.UserInfoBloc>(
        _i6.UserInfoBloc(repository: gh<_i4.UserRepository>()));
    return this;
  }
}
