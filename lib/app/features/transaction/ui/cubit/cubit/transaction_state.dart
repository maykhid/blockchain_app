part of 'transaction_cubit.dart';

@freezed
class TransactionState with _$TransactionState {
  const factory TransactionState.initial() = _Initial;
  const factory TransactionState.loading({String? loadingMessage}) = _Loading;
  const factory TransactionState.success({
    required RawBlockResponse rawBlockResponse,
  }) = _Success;
  const factory TransactionState.successTezos({
    required List<TezosBlocksResponse> tezosBlocksResponse,
  }) = _SuccessTezos;
  const factory TransactionState.failed({required String errorMessage}) =
      _Failure;
}
