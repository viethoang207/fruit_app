import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:training_example/features/home/bloc/user_info_bloc/user_info_event.dart';
import 'package:training_example/features/home/bloc/user_info_bloc/user_info_state.dart';
import 'package:training_example/repositories/user_repository.dart';

@singleton
class UserInfoBloc extends Bloc<UserInfoEvent, UserInfoState> {
  final UserRepository repository;

  UserInfoBloc({required this.repository}) : super(UserInfoLoadingState()) {
    on<FetchCurrentUserInfoEvent>((event, emit) async {
      var info = await repository.getCurrentUserInfo();
      emit(UserInfoFetchedState(userInfo: info));
    });
  }
}
