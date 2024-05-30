import 'package:blockchain_app/app/features/transaction/data/model/latest_block_response.dart';
import 'package:blockchain_app/app/features/transaction/data/model/raw_block_response.dart';
import 'package:blockchain_app/app/features/transaction/data/model/tezos_blocks_response.dart';

abstract class TransactionInterface {
  Future<LatestBlockResponse> getLastestBlock();
  Future<RawBlockResponse> getRawBlock(String blockHash);
  Future<List<TezosBlocksResponse>> getTezosBlocks();
}
