import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:training_example/constants/constants.dart';
import 'package:training_example/fake_api/bloc/user_event.dart';
import 'package:training_example/fake_api/bloc/user_state.dart';
import 'package:training_example/fake_api/repository/remote_user_repository.dart';

import '../model/users.dart';

@singleton
class RemoteUsersBloc extends Bloc<RemoteUsersEvent, RemoteUsersState> {
  final RemoteUserRepository repository;

  RemoteUsersBloc({required this.repository}) : super(RemoteUsersLoadingState()) {
    on<FetchRemoteUsersEvent>(_onFetchRemoteUsersEvent);
  }

  Future<void> _onFetchRemoteUsersEvent(FetchRemoteUsersEvent event, Emitter<RemoteUsersState> emit) async {
    try {
      var users = <RemoteUser>[];

      if (event.isFirstTime == true) {
        emit(RemoteUsersLoadingState());
        var data = await repository.getUsers(limit: Constants.userLoadingThreshold, skip: 0);
        users.addAll(data);
      } else {
        var fetchedUserState = state as RemoteUsersFetchedState;
        var oldUsers = fetchedUserState.users;
        var newUsers = await repository.getUsers(limit: Constants.userLoadingThreshold, skip: oldUsers.length);
        users.addAll(oldUsers);
        users.addAll(newUsers);
      }

      emit(RemoteUsersFetchedState(users: users));

    } on Exception catch (e) {
      emit(RemoteUsersErrorState(error: e.toString()));
    }
  }
}