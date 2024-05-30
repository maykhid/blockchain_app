part of 'sign_in_cubit.dart';

final class SignInState extends Equatable {
  const SignInState({
    this.email = const Email.pure(),
    this.password = const PasswordLogin.pure(),
    this.status = FormzSubmissionStatus.initial,
    this.isValid = false,
    this.errorMessage,
  });

  final Email email;
  final PasswordLogin password;
  final bool isValid;
  final String? errorMessage;
  final FormzSubmissionStatus status;

  @override
  List<Object?> get props => [
        password,
        email,
        errorMessage,
        isValid,
        status,
      ];

  SignInState copyWith({
    Email? email,
    PasswordLogin? password,
    bool? isValid,
    FormzSubmissionStatus? status,
    String? errorMessage,
  }) {
    return SignInState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
      isValid: isValid ?? this.isValid,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
