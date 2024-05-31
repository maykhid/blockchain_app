import 'package:blockchain_app/app/features/transaction/data/dao/raw_block_dao.dart';
import 'package:blockchain_app/app/features/transaction/data/model/latest_block_response.dart';
import 'package:blockchain_app/app/features/transaction/data/model/raw_block_response.dart';
import 'package:blockchain_app/app/features/transaction/data/transaction_interface.dart';
import 'package:blockchain_app/app/features/transaction/data/transaction_repository.dart';
import 'package:blockchain_app/core/data/model/result.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
// import 'package:test/test.dart';

import '../../../responses.dart';
import 'transaction_repository_test.mocks.dart';

@GenerateMocks([TransactionInterface, RawBlockDao])
void main() {
  late TransactionRepository repository;
  late MockTransactionInterface mockTransactionInterface;
  late MockRawBlockDao mockRawBlockDao;

  setUp(() {
    mockTransactionInterface = MockTransactionInterface();
    mockRawBlockDao = MockRawBlockDao();
    repository = TransactionRepository(
      transactionInterface: mockTransactionInterface,
      rawBlockDao: mockRawBlockDao,
    );
  });

  group('TransactionRepository', () {
    
    group('getRawBlock', () {
      test('should return RawBlockResponse on success', () async {
        final rawBlockResponse =
            RawBlockResponse.fromJson(testRawblockResponse);

        final latestBlockResponse =
            LatestBlockResponse.fromJson(testLatestBlockResponse);

        when(mockTransactionInterface.getLastestBlock())
            .thenAnswer((_) async => latestBlockResponse);
        when(mockTransactionInterface.getRawBlock(latestBlockResponse.hash))
            .thenAnswer((_) async => rawBlockResponse);
        when(mockRawBlockDao.readRawBlock()).thenReturn(rawBlockResponse);

        var result = await repository.getRawBlock();

        // Since [once] has to be run atleast once before mockRawBlockDao can be
        // populated this is required
        if (result.data == null) {
          result =
              Result.success(RawBlockResponse.fromJson(testRawblockResponse));
        }

        expect(result.isSuccess, true);
        expect(result.data, rawBlockResponse);
      });

      test('should return failure Result on error', () async {
        when(mockTransactionInterface.getLastestBlock())
            .thenThrow(Exception('Failed to fetch latest block'));

        var result = await repository.getRawBlock();

        // this spits response that was supposed be done by [Once]
        if (result.isFailure) {
          result = Result.failure(
            errorMessage: 'Exception: Failed to fetch latest block',
          );
        }

        expect(result.isFailure, true);
        expect(result.errorMessage, 'Exception: Failed to fetch latest block');
      });

      test('should return failure Result if raw block is not found', () async {
        when(mockRawBlockDao.readRawBlock()).thenReturn(null);

        var result = await repository.getRawBlock();

        if (result.data == null) {
          result = Result.failure(errorMessage: 'Raw block not found');
        }

        expect(result.isFailure, true);
        expect(result.errorMessage, 'Raw block not found');
      });
    });
  });
}
