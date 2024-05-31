import 'package:blockchain_app/app/features/auth/data/authentication_interface.dart';
import 'package:blockchain_app/app/features/auth/data/dao/user_dao.dart';
import 'package:blockchain_app/app/features/auth/data/model/user.dart';
import 'package:blockchain_app/app/features/transaction/data/dao/raw_block_dao.dart';
import 'package:blockchain_app/core/data/model/result.dart';
import 'package:injectable/injectable.dart';
import 'package:once/once.dart';

@singleton
class AuthenticationRepository {
  AuthenticationRepository({
    required IAuthentication authenticationInterface,
    required UserDao userDao,
    required RawBlockDao rawBlockDao,
  })  : _authenticationInterface = authenticationInterface,
        _userDao = userDao,
        _rawBlockDao = rawBlockDao;

  final IAuthentication _authenticationInterface;
  final UserDao _userDao;
  final RawBlockDao _rawBlockDao;

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
      _rawBlockDao.deleteRawBlock();
      Once.clearAll();
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
