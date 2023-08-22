import 'package:training_example/models/user_info/user.dart' as user;

abstract class UserInfoState{}

class UserInfoLoadingState extends UserInfoState {
}

class UserInfoFetchedState extends UserInfoState {
  final user.UserInfo userInfo;

  UserInfoFetchedState({
    required this.userInfo,
  });
}