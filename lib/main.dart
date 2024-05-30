import 'package:blockchain_app/app/app.dart';
import 'package:blockchain_app/app/features/auth/data/model/user.dart';
import 'package:blockchain_app/app/features/transaction/data/model/raw_block_response.dart';
import 'package:blockchain_app/core/di/di.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  await setup();
  runApp(const BlockchainApp());
}

// ignore:  inference_failure_on_function_return_type, always_declare_return_types, type_annotate_public_apis
setup() async {
  WidgetsFlutterBinding.ensureInitialized();

  var path = '/assets/db';
  // i test on web using developer tools mobile screens hence the check
  if (!kIsWeb) {
    final appDocDir = await getApplicationDocumentsDirectory();
    path = appDocDir.path;
  }
  // final dir = await getApplicationDocumentsDirectory();
  final dbPath = join(path, '.db.hive');
  await Hive.initFlutter(dbPath);

  Hive
    ..registerAdapter(UserAdapter())
    ..registerAdapter(RawBlockResponseImplAdapter())
    ..registerAdapter(TxImplAdapter())
    ..registerAdapter(InputImplAdapter())
    ..registerAdapter(OutImplAdapter())
    ..registerAdapter(SpendingOutpointImplAdapter());

  await initDependencies();
}
