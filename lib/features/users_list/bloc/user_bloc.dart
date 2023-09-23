import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:training_example/constants/constants.dart';
import 'package:training_example/features/users_list/bloc/user_event.dart';
import 'package:training_example/features/users_list/bloc/user_state.dart';
import 'package:training_example/repositories/remote_user_repository.dart';

import '../../../models/users.dart';

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
        users.addAll(data as Iterable<RemoteUser>);
      } else {
        var fetchedUserState = state as RemoteUsersFetchedState;
        var oldUsers = fetchedUserState.users;
        var newUsers = await repository.getUsers(limit: Constants.userLoadingThreshold, skip: oldUsers.length);
        users.addAll(oldUsers as Iterable<RemoteUser>);
        users.addAll(newUsers as Iterable<RemoteUser>);
      }

      emit(RemoteUsersFetchedState(users: users));

    } on Exception catch (e) {
      emit(RemoteUsersErrorState(error: e.toString()));
    }
  }
}