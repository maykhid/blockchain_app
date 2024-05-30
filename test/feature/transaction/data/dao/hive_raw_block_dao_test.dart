import 'package:blockchain_app/app/features/transaction/data/dao/hive_raw_block_dao.dart';
import 'package:blockchain_app/app/features/transaction/data/model/raw_block_response.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/adapters.dart';

import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../responses.dart';
import 'hive_raw_block_dao_test.mocks.dart';

// Generate mocks
@GenerateMocks([Box])
void main() {
  late MockBox<RawBlockResponse> mockBox;
  late HiveRawBlockDao hiveRawBlockDao;

  const blockKey = '__block__key__';

  setUp(() {
    mockBox = MockBox<RawBlockResponse>();
    hiveRawBlockDao = HiveRawBlockDao(box: mockBox);
  });

  group('HiveRawBlockDao', () {
    test('deleteRawBlock removes block from the box', () {
      hiveRawBlockDao.deleteRawBlock();

      verify(mockBox.delete(blockKey)).called(1);
    });

    test('isRawBlockAvailable returns true when box is not empty', () {
      when(mockBox.isNotEmpty).thenReturn(true);

      final exists = hiveRawBlockDao.isRawBlockAvailable;

      expect(exists, true);
      verify(mockBox.isNotEmpty).called(1);
    });

    test('isRawBlockAvailable returns false when box is empty', () {
      when(mockBox.isNotEmpty).thenReturn(false);

      final exists = hiveRawBlockDao.isRawBlockAvailable;

      expect(exists, false);
      verify(mockBox.isNotEmpty).called(1);
    });

    test('readRawBlock returns null when box is empty', () {
      when(mockBox.get(blockKey)).thenReturn(null);

      final result = hiveRawBlockDao.readRawBlock();

      expect(result, null);
      verify(mockBox.get(blockKey)).called(1);
    });

    test('readRawBlock returns RawBlockResponse from the box when it exists',
        () {
      final block = RawBlockResponse.fromJson(
        testRawblockResponse,
      ); // Create a dummy RawBlockResponse object
      when(mockBox.get(blockKey)).thenReturn(block);

      final result = hiveRawBlockDao.readRawBlock();

      expect(result, block);
      verify(mockBox.get(blockKey)).called(1);
    });

    test('writeRawBlock stores RawBlockResponse in the box', () {
      final block = RawBlockResponse.fromJson(
        testRawblockResponse,
      ); // Create a dummy RawBlockResponse object

      hiveRawBlockDao.writeRawBlock(block);

      verify(mockBox.put(blockKey, block)).called(1);
    });
  });
}
