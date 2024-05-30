import 'package:blockchain_app/app/features/transaction/data/dao/raw_block_dao.dart';
import 'package:blockchain_app/app/features/transaction/data/model/raw_block_response.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: RawBlockDao)
class HiveRawBlockDao extends RawBlockDao {
  HiveRawBlockDao({required Box<RawBlockResponse> box}) : _box = box;

  final Box<RawBlockResponse> _box;

  static const String _key = '__block__key__';

  @override
  void deleteRawBlock() => _box.delete(_key);

  @override
  bool get isRawBlockAvailable => _box.isNotEmpty;

  @override
  RawBlockResponse? readRawBlock() => _box.get(_key);

  @override
  void writeRawBlock(RawBlockResponse rawBlockResponse) =>
      _box.put(_key, rawBlockResponse);
}
