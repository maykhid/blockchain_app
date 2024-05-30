import 'package:blockchain_app/app/features/transaction/data/model/raw_block_response.dart';

abstract class RawBlockDao {
  void writeRawBlock(RawBlockResponse rawBlockResponse);
  void deleteRawBlock();
  bool get isRawBlockAvailable;
  RawBlockResponse? readRawBlock();
}
