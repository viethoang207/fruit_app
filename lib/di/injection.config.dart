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
    as _i7;
import 'package:training_example/features/cart/bloc/cart_bloc.dart' as _i8;
import 'package:training_example/features/home/bloc/product_bloc/product_bloc.dart'
    as _i9;
import 'package:training_example/features/home/bloc/user_info_bloc/user_info_bloc.dart'
    as _i10;
import 'package:training_example/repositories/auth_repository.dart' as _i3;
import 'package:training_example/repositories/cart_repository.dart' as _i4;
import 'package:training_example/repositories/product_repository.dart' as _i5;
import 'package:training_example/repositories/user_repository.dart' as _i6;

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
    gh.singleton<_i4.CartRepository>(_i4.CartRepository());
    gh.singleton<_i5.ProductRepository>(_i5.ProductRepository());
    gh.singleton<_i6.UserRepository>(_i6.UserRepository());
    gh.singleton<_i7.AuthBloc>(
        _i7.AuthBloc(authRepository: gh<_i3.AuthRepository>()));
    gh.singleton<_i8.CartBloc>(
        _i8.CartBloc(cartRepo: gh<_i4.CartRepository>()));
    gh.singleton<_i9.ProductBloc>(
        _i9.ProductBloc(repository: gh<_i5.ProductRepository>()));
    gh.singleton<_i10.UserInfoBloc>(
        _i10.UserInfoBloc(repository: gh<_i6.UserRepository>()));
    return this;
  }
}
