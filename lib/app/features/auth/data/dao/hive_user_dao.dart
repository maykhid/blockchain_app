import 'package:blockchain_app/app/features/auth/data/dao/user_dao.dart';
import 'package:blockchain_app/app/features/auth/data/model/user.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: UserDao)
class HiveUserDao implements UserDao {
  HiveUserDao({
    required Box<User> userBox,
  }) : _userBox = userBox;

  final Box<User> _userBox;

  static const String _key = '__user__key__';

  @override
  User readUser() {
    if (_userBox.isEmpty) {
      return User.empty;
    }
    return _userBox.get(_key) ?? User.empty;
  }

  @override
  void writeUser(User authenticatedUser) =>
      _userBox.put(_key, authenticatedUser);

  @override
  void deleteUser() => _userBox.delete(_key);

  @override
  bool get userExists => _userBox.isNotEmpty;
}
