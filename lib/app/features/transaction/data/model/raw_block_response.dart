// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/adapters.dart';

part 'raw_block_response.g.dart';
part 'raw_block_response.freezed.dart';

@freezed
class RawBlockResponse with _$RawBlockResponse {
  @HiveType(typeId: 1)
  const factory RawBlockResponse({
    @JsonKey(name: 'hash') @HiveField(0) required String hash,
    @JsonKey(name: 'ver') @HiveField(1) required int ver,
    @JsonKey(name: 'prev_block') @HiveField(2) required String prevBlock,
    @JsonKey(name: 'mrkl_root') @HiveField(3) required String mrklRoot,
    @JsonKey(name: 'time') @HiveField(4) required int time,
    @JsonKey(name: 'bits') @HiveField(5) required int bits,
    @JsonKey(name: 'next_block') @HiveField(6) required List<String> nextBlock,
    @JsonKey(name: 'fee') @HiveField(7) required int fee,
    @JsonKey(name: 'nonce') @HiveField(8) required int nonce,
    @JsonKey(name: 'n_tx') @HiveField(9) required int nTx,
    @JsonKey(name: 'size') @HiveField(10) required int size,
    @JsonKey(name: 'block_index') @HiveField(11) required int blockIndex,
    @JsonKey(name: 'main_chain') @HiveField(12) required bool mainChain,
    @JsonKey(name: 'height') @HiveField(13) required int height,
    @JsonKey(name: 'weight') @HiveField(14) required int weight,
    @JsonKey(name: 'tx') @HiveField(15) required List<Tx> tx,
  }) = _RawBlockResponse;

  factory RawBlockResponse.fromJson(Map<String, dynamic>? json) =>
      _$RawBlockResponseFromJson(json!);
}

@freezed
class Tx with _$Tx {
  @HiveType(typeId: 2)
  const factory Tx({
    @JsonKey(name: 'hash') @HiveField(0) required String hash,
    @JsonKey(name: 'ver') @HiveField(1) required int ver,
    @JsonKey(name: 'vin_sz') @HiveField(2) required int vinSz,
    @JsonKey(name: 'vout_sz') @HiveField(3) required int voutSz,
    @JsonKey(name: 'size') @HiveField(4) required int size,
    @JsonKey(name: 'weight') @HiveField(5) required int weight,
    @JsonKey(name: 'fee') @HiveField(6) required int fee,
    @JsonKey(name: 'relayed_by') @HiveField(7) required String relayedBy,
    @JsonKey(name: 'lock_time') @HiveField(8) required int lockTime,
    @JsonKey(name: 'tx_index') @HiveField(9) required int txIndex,
    @JsonKey(name: 'double_spend') @HiveField(10) required bool doubleSpend,
    @JsonKey(name: 'time') @HiveField(11) required int time,
    @JsonKey(name: 'block_index') @HiveField(12) required int blockIndex,
    @JsonKey(name: 'block_height') @HiveField(13) required int blockHeight,
    @JsonKey(name: 'inputs') @HiveField(14) required List<Input> inputs,
    @JsonKey(name: 'out') @HiveField(15) required List<Out> out,
  }) = _Tx;

  factory Tx.fromJson(Map<String, dynamic>? json) =>
      _$TxFromJson(json!);
}

@freezed
class Input with _$Input {
  @HiveType(typeId: 3)
  const factory Input({
    @JsonKey(name: 'sequence') @HiveField(0) required int sequence,
    @JsonKey(name: 'witness') @HiveField(1) required String witness,
    @JsonKey(name: 'script') @HiveField(2) required String script,
    @JsonKey(name: 'index') @HiveField(3) required int index,
    @JsonKey(name: 'prev_out') @HiveField(4) required Out prevOut,
  }) = _Input;

  factory Input.fromJson(Map<String, dynamic>? json) =>
      _$InputFromJson(json!);
}

@freezed
class Out with _$Out {
  @HiveType(typeId: 4)
  const factory Out({
    @JsonKey(name: 'type') @HiveField(0) required int type,
    @JsonKey(name: 'spent') @HiveField(1) required bool spent,
    @JsonKey(name: 'value') @HiveField(2) required int value,
    @JsonKey(name: 'spending_outpoints')
    @HiveField(3) required List<SpendingOutpoint> spendingOutpoints,
    @JsonKey(name: 'n') @HiveField(4) required int n,
    @JsonKey(name: 'tx_index') @HiveField(5) required int txIndex,
    @JsonKey(name: 'script') @HiveField(6) required String script,
    @JsonKey(name: 'addr') @HiveField(7) String? addr,
  }) = _Out;

   factory Out.fromJson(Map<String, dynamic>? json) =>
      _$OutFromJson(json!);
}

@freezed
class SpendingOutpoint with _$SpendingOutpoint {
  @HiveType(typeId: 5)
  const factory SpendingOutpoint({
    @JsonKey(name: 'tx_index') @HiveField(0) required int txIndex,
    @JsonKey(name: 'n') @HiveField(1) required int n,
  }) = _SpendingOutpoint;

  factory SpendingOutpoint.fromJson(Map<String, dynamic>? json) =>
      _$SpendingOutpointFromJson(json!);
}
