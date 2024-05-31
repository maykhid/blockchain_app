import 'package:blockchain_app/app/features/transaction/data/dao/raw_block_dao.dart';
import 'package:blockchain_app/app/features/transaction/data/model/latest_block_response.dart';
import 'package:blockchain_app/app/features/transaction/data/model/raw_block_response.dart';
import 'package:blockchain_app/app/features/transaction/data/model/tezos_blocks_response.dart';
import 'package:blockchain_app/app/features/transaction/data/transaction_interface.dart';
import 'package:blockchain_app/core/data/model/result.dart';
import 'package:injectable/injectable.dart';
import 'package:once/once.dart';

@singleton
class TransactionRepository {
  TransactionRepository({
    required TransactionInterface transactionInterface,
    required RawBlockDao rawBlockDao,
  })  : _transactionInterface = transactionInterface,
        _rawBlockDao = rawBlockDao;

  final TransactionInterface _transactionInterface;
  final RawBlockDao _rawBlockDao;

  Future<Result<LatestBlockResponse>> _getLatestBlock() async {
    try {
      final response = await _transactionInterface.getLastestBlock();

      return Result.success(response);
    } catch (e) {
      return Result.failure(errorMessage: e.toString());
    }
  }

  Future<Result<RawBlockResponse?>> getRawBlock() async {
    try {
      // if (latestBlockResponse.isSuccess) {
      // fetch new raw block data every 15 minutes

      // ignore: unawaited_futures
      await Once.runCustom(
        'fetchRawBlock',
        duration: const Duration(minutes: 15),
        callback: () async {
          final latestBlockResponse = await _getLatestBlock();

          await _fetchRawBlock(latestBlockResponse.data!.hash);
        },
      );

      // always gets the most up to date raw block (in the last 15 minutes)
      // from the cache
      final rawBlock = _rawBlockDao.readRawBlock();

      if (rawBlock == null) {
        // clear key to enable raw block to be fetched on error
        Once.clear(key: 'fetchRawBlock'); 
        return Result.failure(errorMessage: 'Raw block not found');
      }

      return Result.success(rawBlock);
    } catch (e) {
      // clear key to enable raw block to be fetched again on error
      Once.clear(key: 'fetchRawBlock'); 
      return Result.failure(errorMessage: e.toString());
    }
  }

  Future<Result<List<TezosBlocksResponse>>> getTezosBlocks() async {
    try {
      final response = await _transactionInterface.getTezosBlocks();

      return Result.success(response);
    } catch (e) {
      return Result.failure(errorMessage: e.toString());
    }
  }

  /// fetch new raw block data and cache response
  Future<void> _fetchRawBlock(String blockHash) async {
    try {
      final response = await _transactionInterface.getRawBlock(blockHash);
      // cache raw block response
      _rawBlockDao.writeRawBlock(response);
    } catch (e) {
      rethrow;
    }
  }
}
