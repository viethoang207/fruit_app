import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
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

      if (event.skip == 0) {
        emit(RemoteUsersLoadingState());
        var data = await repository.getUsers(limit: event.limit, skip: 0);
        users.addAll(data);
      } else if (state is RemoteUsersFetchedState) {
        var fetchedUserState = state as RemoteUsersFetchedState;
        var oldUsers = fetchedUserState.users;
        // var newUsers = await repository.getUsers(limit: event.limit, skip: event.skip);
        var newUsers = fetchedUserState.users;
        users.addAll(oldUsers);
        users.addAll(newUsers);
      }

      emit(RemoteUsersFetchedState(users: users));

    } on Exception catch (e) {
      emit(RemoteUsersErrorState(error: e.toString()));
    }
  }
}