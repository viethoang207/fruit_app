import 'package:equatable/equatable.dart';
import 'package:training_example/models/user_info/user.dart' as user;

abstract class UserInfoState extends Equatable {}

class UserInfoLoadingState extends UserInfoState {
  @override
  List<Object?> get props => [];
}

class UserInfoFetchedState extends UserInfoState {
  final user.UserInfo userInfo;

  UserInfoFetchedState({
    required this.userInfo,
  });

  @override
  List<Object?> get props => [];
}