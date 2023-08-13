import 'package:equatable/equatable.dart';

abstract class UserInfoEvent extends Equatable{
  @override
  List<Object> get props =>[];
}

class FetchCurrentUserInfoEvent extends UserInfoEvent {}