part of 'authentication_cubit.dart';

sealed class AuthenticationState extends Equatable {
  const AuthenticationState(this.user);
  @override
  List<Object?> get props => [user];

  final User? user;
}

class AuthenticatedState extends AuthenticationState {
  const AuthenticatedState(super.user);
}

class UnauthenticatedState extends AuthenticationState {
  const UnauthenticatedState() : super(null);
}
