import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:training_example/constants/constants.dart';
import '../../repositories/auth_repository.dart';
part 'auth_event.dart';
part 'auth_state.dart';

@singleton
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc({required this.authRepository}) : super(UnAuthenticatedState()){
    on<LoginRequest>((event, state) async {
      emit(Loading());
      try {
        var result = await authRepository.signIn(email: event.email, password: event.password);
        if (result != Constants.loginSuccess) {
          emit(AuthenticateErrorState(error: result));
        } else {
          emit(AuthenticatedState());
        }
      } catch (e) {
        emit(AuthenticateErrorState(error: e.toString()));
      }
    });

    on<LogoutRequest>((event, state) {
      authRepository.signOut();
    });

    on<SignUpRequest>((event, state) async {
      emit(Loading());
      try {
        var result = await authRepository.createAccount(email: event.email, password: event.password);
        if (result != Constants.loginSuccess) {
          emit(SignUpErrorState(error: result));
        } else {
          emit(AuthenticatedState());
        }
      } catch (e) {
        emit(SignUpErrorState(error: e.toString()));
      }
    });
  }
}