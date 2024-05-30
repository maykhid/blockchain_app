// ignore_for_file: invalid_annotation_target

import 'package:blockchain_app/app/features/auth/data/model/user.dart';
import 'package:blockchain_app/app/features/transaction/data/model/raw_block_response.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

@module
abstract class RegisterModule {
  // @singleton
  @preResolve
  Future<Box<User>> get userBox => Hive.openBox<User>('userBox');
  @preResolve
  Future<Box<RawBlockResponse>> get rawBlockBox =>
      Hive.openBox<RawBlockResponse>('rawBlockBox');
}
