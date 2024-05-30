import 'package:blockchain_app/app/features/auth/data/model/user.dart';

abstract class IAuthentication {
  Future<void> signIn();
  Future<void> signOut();
  User get authenticatedUser;
}
