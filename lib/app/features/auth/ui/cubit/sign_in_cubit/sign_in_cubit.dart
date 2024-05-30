import 'package:blockchain_app/app/features/auth/data/authentication_repository.dart';
import 'package:blockchain_app/app/features/auth/ui/cubit/authentication_cubit/authentication_cubit.dart';
import 'package:blockchain_app/core/di/di.dart';
import 'package:blockchain_app/core/utils/validation_models.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit({
    required AuthenticationCubit authenticationCubit,
    AuthenticationRepository? authenticationRepository,
  })  : _authenticationRepository =
            authenticationRepository ?? locator<AuthenticationRepository>(),
        _authenticationCubit = authenticationCubit,
        super(const SignInState());

  final AuthenticationRepository _authenticationRepository;
  final AuthenticationCubit _authenticationCubit;

  void passwordChanged(String value) {
    final password = PasswordLogin.dirty(value);

    emit(
      state.copyWith(
        password: password,
        isValid: Formz.validate([
          state.email,
          password,
        ]),
      ),
    );
  }

  void emailChanged(String value) {
    final email = Email.dirty(value);
    emit(
      state.copyWith(
        email: email,
        isValid: Formz.validate([
          state.password,
          email,
        ]),
      ),
    );
  }

  Future<void> signIn() async {
    if (!state.isValid) return;
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    final response = await _authenticationRepository.signIn();

    if (response.isFailure) {
      emit(
        state.copyWith(
          status: FormzSubmissionStatus.failure,
          errorMessage: response.errorMessage,
        ),
      );
    } else {
      _authenticationCubit.updateUserState();
      emit(state.copyWith(status: FormzSubmissionStatus.success));
    }
  }
}
