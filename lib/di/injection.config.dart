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
    as _i13;
import 'package:training_example/features/cart/bloc/cart_bloc.dart' as _i14;
import 'package:training_example/features/general_page/bloc/connectivity_bloc.dart'
    as _i6;
import 'package:training_example/features/home/bloc/product_bloc/product_bloc.dart'
    as _i15;
import 'package:training_example/features/home/bloc/user_info_bloc/user_info_bloc.dart'
    as _i16;
import 'package:training_example/features/search/bloc/search_bloc.dart' as _i10;
import 'package:training_example/features/users_list/bloc/user_bloc.dart'
    as _i9;
import 'package:training_example/features/users_list/service/api_service.dart'
    as _i3;
import 'package:training_example/repositories/auth_repository.dart' as _i4;
import 'package:training_example/repositories/cart_repository.dart' as _i5;
import 'package:training_example/repositories/product_repository.dart' as _i7;
import 'package:training_example/repositories/remote_user_repository.dart'
    as _i8;
import 'package:training_example/repositories/user_repository.dart' as _i11;
import 'package:training_example/repositories/vn_address_repository.dart'
    as _i12;

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
    gh.singleton<_i3.ApiService>(_i3.ApiService());
    gh.singleton<_i4.AuthRepository>(_i4.AuthRepository());
    gh.singleton<_i5.CartRepository>(_i5.CartRepository());
    gh.singleton<_i6.ConnectivityBloc>(_i6.ConnectivityBloc());
    gh.singleton<_i7.ProductRepository>(_i7.ProductRepository());
    gh.singleton<_i8.RemoteUserRepository>(
        _i8.RemoteUserRepository(apiService: gh<_i3.ApiService>()));
    gh.singleton<_i9.RemoteUsersBloc>(
        _i9.RemoteUsersBloc(repository: gh<_i8.RemoteUserRepository>()));
    gh.singleton<_i10.SearchBloc>(
        _i10.SearchBloc(repository: gh<_i7.ProductRepository>()));
    gh.singleton<_i11.UserRepository>(_i11.UserRepository());
    gh.singleton<_i12.VNAddressRepository>(_i12.VNAddressRepository());
    gh.singleton<_i13.AuthBloc>(
        _i13.AuthBloc(authRepository: gh<_i4.AuthRepository>()));
    gh.singleton<_i14.CartBloc>(
        _i14.CartBloc(cartRepo: gh<_i5.CartRepository>()));
    gh.singleton<_i15.ProductBloc>(
        _i15.ProductBloc(repository: gh<_i7.ProductRepository>()));
    gh.singleton<_i16.UserInfoBloc>(
        _i16.UserInfoBloc(repository: gh<_i11.UserRepository>()));
    return this;
  }
}
