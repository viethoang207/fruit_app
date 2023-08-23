
abstract class UserInfoEvent{}

class FetchCurrentUserInfoEvent extends UserInfoEvent {}

class ChangeNameEvent extends UserInfoEvent {
  final String name;

  ChangeNameEvent({
    required this.name,
  });
}