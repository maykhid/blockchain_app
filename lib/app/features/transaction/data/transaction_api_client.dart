import 'package:blockchain_app/app/features/transaction/data/model/latest_block_response.dart';
import 'package:blockchain_app/app/features/transaction/data/model/raw_block_response.dart';
import 'package:blockchain_app/app/features/transaction/data/model/tezos_blocks_response.dart';
import 'package:blockchain_app/app/features/transaction/data/transaction_interface.dart';
import 'package:blockchain_app/app/shared/data/http_response_handler.dart';
import 'package:blockchain_app/app/shared/data/interceptor/api_request_interceptor.dart';
import 'package:blockchain_app/core/data/endpoints.dart';

import 'package:http_interceptor/http_interceptor.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: TransactionInterface)
class TransactionApiClient extends TransactionInterface {
  TransactionApiClient({
    required APIRequestInterceptor apiRequestInterceptor,
  }) : _apiRequestInterceptor = apiRequestInterceptor;

  final APIRequestInterceptor _apiRequestInterceptor;

  Client get _client => InterceptedClient.build(
        interceptors: [
          _apiRequestInterceptor,
        ],
      );

  @override
  Future<LatestBlockResponse> getLastestBlock() async {
    final latestBlockUrl =
        '$blockchainBaseUrl$blockchainLatestBlockPath'.toUri();

    final httpRequest = _client.get(latestBlockUrl);

    final response = await responseHandler<LatestBlockResponse>(
      httpRequest: httpRequest,
      builder: LatestBlockResponse.fromJson,
    );

    return response;
  }

  @override
  Future<RawBlockResponse> getRawBlock(String blockHash) async {
    final rawBlockUrl =
        '$blockchainBaseUrl${blockchainRawBlockPath(blockHash)}'.toUri();

    final httpRequest = _client.get(rawBlockUrl);

    final response = await responseHandler<RawBlockResponse>(
      httpRequest: httpRequest,
      builder: RawBlockResponse.fromJson,
    );

    return response;
  }

  // @override
  // Future<TezosBlocksResponse> getTezosBlocks() {
  //   // `TODO`: implement getTezosBlocks
  //   throw UnimplementedError();
  // }

  @override
  Future<List<TezosBlocksResponse>> getTezosBlocks() async {
    final latestBlockUrl = '$tezosBaseUrl$tezosBlockPath'.toUri();

    final httpRequest = _client.get(latestBlockUrl);

    final response = await responseHandler<List<TezosBlocksResponse>>(
      httpRequest: httpRequest,
      builderOnList: (response) => response
          .map((e) => TezosBlocksResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

    return response;
  }
}
