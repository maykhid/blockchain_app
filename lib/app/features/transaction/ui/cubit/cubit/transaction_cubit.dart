import 'package:blockchain_app/app/features/transaction/data/model/raw_block_response.dart';
import 'package:blockchain_app/app/features/transaction/data/model/tezos_blocks_response.dart';
import 'package:blockchain_app/app/features/transaction/data/transaction_repository.dart';
import 'package:blockchain_app/core/di/di.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_state.dart';
part 'transaction_cubit.freezed.dart';

class TransactionCubit extends Cubit<TransactionState> {
  TransactionCubit({TransactionRepository? transactionRepository})
      : _transactionRepository =
            transactionRepository ?? locator<TransactionRepository>(),
        super(const TransactionState.initial());

  final TransactionRepository _transactionRepository;

  Future<void> fetchBlock() async {
    emit(
      const TransactionState.loading(
        loadingMessage: 'Fetching BTC transactions, this might take a while',
      ),
    );

    final response = await _transactionRepository.getRawBlock();

    if (response.isFailure) {
      emit(TransactionState.failed(errorMessage: response.errorMessage!));
    } else {
      emit(TransactionState.success(rawBlockResponse: response.data!));
    }
  }

  Future<void> fetchTezosBloc() async {
    emit(
      const TransactionState.loading(
        loadingMessage: 'Fetching Tezos transactions',
      ),
    );

    final response = await _transactionRepository.getTezosBlocks();

    if (response.isFailure) {
      emit(TransactionState.failed(errorMessage: response.errorMessage!));
    } else {
      emit(TransactionState.successTezos(tezosBlocksResponse: response.data!));
    }
  }
}
