import 'package:blockchain_app/app/features/auth/data/authentication_interface.dart';
import 'package:blockchain_app/app/features/auth/data/dao/user_dao.dart';
import 'package:blockchain_app/app/features/auth/data/model/user.dart';
import 'package:blockchain_app/core/data/model/result.dart';
import 'package:injectable/injectable.dart';

@singleton
class AuthenticationRepository {
  AuthenticationRepository({
    required IAuthentication authenticationInterface,
    required UserDao userDao,
  })  : _authenticationInterface = authenticationInterface,
        _userDao = userDao;

  final IAuthentication _authenticationInterface;
  final UserDao _userDao;

  Future<Result<void>> signIn() async {
    try {
      final response = await _authenticationInterface.signIn();
      final user = _authenticationInterface.authenticatedUser;

      if (user.isNotEmpty) {
        _userDao.writeUser(user);
      } else {
        throw Exception('An error occured: No valid user!');
      }

      return Result.success(response);
    } catch (e) {
      return Result.failure(errorMessage: e.toString());
    }
  }

  Future<Result<void>> signOut() async {
    try {
      final response = await _authenticationInterface.signOut();
      _userDao.deleteUser();
      return Result.success(response);
    } catch (e) {
      return Result.failure(errorMessage: e.toString());
    }
  }

  User get user {
    if (_userDao.userExists) {
      return _userDao.readUser();
    }
    return User.empty;
  }
}
