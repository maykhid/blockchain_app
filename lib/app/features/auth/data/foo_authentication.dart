// ignore_for_file: inference_failure_on_instance_creation

import 'package:blockchain_app/app/features/auth/data/authentication_interface.dart';
import 'package:blockchain_app/app/features/auth/data/model/user.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: IAuthentication)
class FooAuthentication extends IAuthentication {
  //
  final _duration = const Duration(seconds: 3);

  User _authenticatedUser = User.empty;

  @override
  User get authenticatedUser => _authenticatedUser;

  @override
  Future<void> signIn() async {
    try {
      _authenticatedUser = const User(id: '01', name: 'foo');
      await Future.delayed(_duration);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await Future.delayed(_duration);
    } catch (e) {
      throw Exception(e);
    }
  }
}
