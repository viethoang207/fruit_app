import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:training_example/fake_api/bloc/user_event.dart';
import 'package:training_example/fake_api/bloc/user_state.dart';
import 'package:training_example/fake_api/repository/remote_user_repository.dart';

@singleton
class RemoteUsersBloc extends Bloc<RemoteUsersEvent, RemoteUsersState> {
  final RemoteUserRepository repository;

  RemoteUsersBloc({required this.repository}) : super(RemoteUsersLoadingState()) {
    on<FetchRemoteUsersEvent>((event, emit) async {
      try {
        if (event.skip == 0) {
          emit(RemoteUsersLoadingState());
        }
        var users = await repository.getUsers(limit: event.limit, skip: event.skip);
        emit(RemoteUsersFetchedState(users: users));
      } on Exception catch (e) {
        emit(RemoteUsersErrorState(error: e.toString()));
      }
    });
  }
}