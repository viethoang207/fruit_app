abstract class RemoteUsersEvent {}

class FetchRemoteUsersEvent extends RemoteUsersEvent {
  final int limit;
  final int skip;

  FetchRemoteUsersEvent({
    required this.limit,
    required this.skip,
  });
}