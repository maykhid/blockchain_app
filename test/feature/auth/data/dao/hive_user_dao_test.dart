import 'package:blockchain_app/app/features/auth/data/dao/hive_user_dao.dart';
import 'package:blockchain_app/app/features/auth/data/model/user.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'hive_user_dao_test.mocks.dart';

// Generate mocks
@GenerateMocks([Box])
void main() {
  late MockBox<User> mockUserBox;
  late HiveUserDao hiveUserDao;

  const userKey = '__user__key__';

  setUp(() {
    mockUserBox = MockBox<User>();
    hiveUserDao = HiveUserDao(userBox: mockUserBox);
  });

  group('HiveUserDao', () {
    test('readUser returns User.empty when box is empty', () {
      when(mockUserBox.isEmpty).thenReturn(true);

      final user = hiveUserDao.readUser();

      expect(user, User.empty);
      verify(mockUserBox.isEmpty).called(1);
    });

    test('readUser returns user from box when it exists', () {
      const user = User(id: '123', name: 'Test User');
      when(mockUserBox.isEmpty).thenReturn(false);
      when(mockUserBox.get(userKey)).thenReturn(user);

      final result = hiveUserDao.readUser();

      expect(result, user);
      verify(mockUserBox.get(userKey)).called(1);
    });

    test('writeUser stores user in the box', () {
      const user = User(id: '123', name: 'Test User');

      hiveUserDao.writeUser(user);

      verify(mockUserBox.put(userKey, user)).called(1);
    });

    test('deleteUser removes user from the box', () {
      hiveUserDao.deleteUser();

      verify(mockUserBox.delete(userKey)).called(1);
    });

    test('userExists returns true when box is not empty', () {
      when(mockUserBox.isNotEmpty).thenReturn(true);

      final exists = hiveUserDao.userExists;

      expect(exists, true);
      verify(mockUserBox.isNotEmpty).called(1);
    });

    test('userExists returns false when box is empty', () {
      when(mockUserBox.isNotEmpty).thenReturn(false);

      final exists = hiveUserDao.userExists;

      expect(exists, false);
      verify(mockUserBox.isNotEmpty).called(1);
    });
  });
}
