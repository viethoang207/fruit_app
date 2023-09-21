import 'package:training_example/fake_api/model/users.dart';

abstract class RemoteUsersState {}

class RemoteUsersLoadingState extends RemoteUsersState {}

class RemoteUsersErrorState extends RemoteUsersState {
  final String error;
  RemoteUsersErrorState({required this.error});
}

class RemoteUsersFetchedState extends RemoteUsersState {
  final List<RemoteUser> users;
  final bool? showLoadMore;

  RemoteUsersFetchedState({
    required this.users,
    required this.showLoadMore;
  });
}

class RemoteUsersLoadingMoreState extends RemoteUsersState {}

