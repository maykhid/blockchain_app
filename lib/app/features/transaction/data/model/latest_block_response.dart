// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'latest_block_response.g.dart';
part 'latest_block_response.freezed.dart';

@freezed
class LatestBlockResponse with _$LatestBlockResponse {
  const factory LatestBlockResponse({
    required String hash,
    required int time,
    @JsonKey(name: 'block_index') required int blockIndex,
    required int height,
    required List<int> txIndexes,
  }) = _LatestBlockResponse;

  factory LatestBlockResponse.fromJson(Map<String, dynamic>? json) =>
      _$LatestBlockResponseFromJson(json!);
}
