import 'package:blockchain_app/app/features/auth/data/model/user.dart';

abstract class UserDao {
  void writeUser(User user);
  void deleteUser();
  bool get userExists;
  User readUser();
}
