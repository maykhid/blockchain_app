import 'dart:convert';

import 'package:blockchain_app/app/features/transaction/data/dao/raw_block_dao.dart';
import 'package:blockchain_app/app/features/transaction/data/model/latest_block_response.dart';
import 'package:blockchain_app/app/features/transaction/data/model/raw_block_response.dart';
import 'package:blockchain_app/app/features/transaction/data/transaction_api_client.dart';
import 'package:blockchain_app/app/features/transaction/data/transaction_interface.dart';
import 'package:blockchain_app/app/shared/data/http_response_handler.dart';
import 'package:blockchain_app/app/shared/data/interceptor/api_request_interceptor.dart';
import 'package:blockchain_app/core/data/endpoints.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../../responses.dart';
import 'transaction_api_client_test.mocks.dart';

// Annotation which generates the mock classes for the provided classes
@GenerateMocks([APIRequestInterceptor, Client])
void main() {
  group('TransactionApiClient', () {
    late TransactionApiClient apiClient;
    late MockAPIRequestInterceptor mockApiRequestInterceptor;
    late MockClient mockHttpClient;

    setUp(() {
      mockApiRequestInterceptor = MockAPIRequestInterceptor();
      mockHttpClient = MockClient();

      apiClient = TransactionApiClient(
        apiRequestInterceptor: mockApiRequestInterceptor,
      );

      // Inject the mock HTTP client into the InterceptedClient
      when(mockApiRequestInterceptor.interceptRequest(request: any)).thenAnswer(
        (_) async => mockApiRequestInterceptor.interceptRequest(
          request: Request('', ''.toUri()),
        ),
      );
      when(mockApiRequestInterceptor.interceptResponse(response: any))
          .thenAnswer((_) async => mockHttpClient.get(''.toUri()));
      // when(mockApiRequestInterceptor.(any, any))
      //     .thenAnswer((_) async => Response('', 500));
    });

    test('getLastestBlock returns LatestBlockResponse', () async {
      final latestBlockResponseJson = testLatestBlockResponse;

      when(mockHttpClient.get(any)).thenAnswer(
        (_) async => Response(jsonEncode(latestBlockResponseJson), 200),
      );

      // final latestBlockResponse =
      await apiClient.getLastestBlock();

      // expect(
      //   latestBlockResponse.hash,
      //   equals(
      //     '0000000000000000000b4d0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e',
      //   ),
      // );
      // expect(latestBlockResponse.time, equals(1625097600));
      // Add other expectations as necessary
    });

    test('getRawBlock returns RawBlockResponse', () async {
      final rawBlockResponseJson = testRawblockResponse;

      when(mockHttpClient.get(any)).thenAnswer(
        (_) async => Response(jsonEncode(rawBlockResponseJson), 200),
      );

      final rawBlockResponse = await apiClient.getRawBlock(
        '0000000000000000000b4d0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e',
      );

      expect(
        rawBlockResponse.hash,
        equals(
          '0000000000000000000b4d0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0',
        ),
      );
      expect(rawBlockResponse.ver, equals(1));
      expect(
        rawBlockResponse.prevBlock,
        equals(
          '0000000000000000000a4d0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0',
        ),
      );
      expect(
        rawBlockResponse.mrklRoot,
        equals(
          '4d0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e',
        ),
      );
      expect(rawBlockResponse.time, equals(1625097600));
      expect(rawBlockResponse.bits, equals(403014710));
      expect(
        rawBlockResponse.nextBlock,
        contains(
          '0000000000000000000c4d0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0',
        ),
      );
      expect(rawBlockResponse.fee, equals(5000));
      expect(rawBlockResponse.nonce, equals(2083236893));
      expect(rawBlockResponse.nTx, equals(10));
      expect(rawBlockResponse.size, equals(123456));
      expect(rawBlockResponse.blockIndex, equals(1000000));
      expect(rawBlockResponse.mainChain, isTrue);
      expect(rawBlockResponse.height, equals(680000));
      expect(rawBlockResponse.weight, equals(4000000));
      expect(rawBlockResponse.tx.length, equals(1));
      // Add other expectations as necessary
    });
  });
}
