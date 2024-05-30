import 'package:freezed_annotation/freezed_annotation.dart';

part 'tezos_blocks_response.g.dart';
part 'tezos_blocks_response.freezed.dart';

@freezed
class TezosBlocksResponse with _$TezosBlocksResponse {
  const factory TezosBlocksResponse({
    required int cycle,
    required int level,
    required String hash,
    required String timestamp,
    required int proto,
    required int payloadRound,
    required int blockRound,
    required int validations,
    required int deposit,
    required int rewardLiquid,
    required int rewardStakedOwn,
    required int rewardStakedShared,
    required int bonusLiquid,
    required int bonusStakedOwn,
    required int bonusStakedShared,
    required int fees,
    required bool nonceRevealed,
    required int lbToggleEma,
    required int aiToggleEma,
    required int reward,
    required int bonus,
    required int priority,
    required bool lbEscapeVote,
    required int lbEscapeEma,
    Baker? proposer,
    Baker? producer,
    Baker? baker,
  }) = _TezosBlocksResponse;

  factory TezosBlocksResponse.fromJson(Map<String, dynamic>? json) =>
      _$TezosBlocksResponseFromJson(json!);
}

@freezed
class Baker with _$Baker {
  const factory Baker({
    required String alias,
    required String address,
  }) = _Baker;

  factory Baker.fromJson(Map<String, dynamic>? json) => _$BakerFromJson(json!);
}
