import 'package:blockchain_app/app/features/auth/data/authentication_repository.dart';
import 'package:blockchain_app/app/features/auth/data/model/user.dart';
import 'package:blockchain_app/core/di/di.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit({AuthenticationRepository? authenticationRepository})
      : _authenticationRepository =
            authenticationRepository ?? locator<AuthenticationRepository>(),
        super(
          authenticationRepository!.user.isNotEmpty
              ? AuthenticatedState(authenticationRepository.user)
              : const UnauthenticatedState(),
        );

  final AuthenticationRepository _authenticationRepository;

  void updateUserState() {
    if (_authenticationRepository.user.isEmpty) {
      emit(const UnauthenticatedState());
    } else {
      emit(AuthenticatedState(_authenticationRepository.user));
    }
  }

  Future<void> signOut() async {
    await _authenticationRepository.signOut();
    emit(const UnauthenticatedState());
  }
}
