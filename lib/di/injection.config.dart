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
    as _i6;
import 'package:training_example/models/product/bloc/product_bloc.dart' as _i7;
import 'package:training_example/models/user_info/bloc/user_info_bloc.dart'
    as _i8;
import 'package:training_example/repositories/auth_repository.dart' as _i3;
import 'package:training_example/repositories/product_repository.dart' as _i4;
import 'package:training_example/repositories/user_repository.dart' as _i5;

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
    gh.singleton<_i4.ProductRepository>(_i4.ProductRepository());
    gh.singleton<_i5.UserRepository>(_i5.UserRepository());
    gh.singleton<_i6.AuthBloc>(
        _i6.AuthBloc(authRepository: gh<_i3.AuthRepository>()));
    gh.singleton<_i7.ProductBloc>(
        _i7.ProductBloc(repository: gh<_i4.ProductRepository>()));
    gh.singleton<_i8.UserInfoBloc>(
        _i8.UserInfoBloc(repository: gh<_i5.UserRepository>()));
    return this;
  }
}
