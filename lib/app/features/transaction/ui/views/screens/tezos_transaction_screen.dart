import 'package:blockchain_app/app/features/transaction/data/model/tezos_blocks_response.dart';
import 'package:blockchain_app/app/features/transaction/ui/cubit/cubit/transaction_cubit.dart';
import 'package:blockchain_app/app/features/transaction/ui/views/screens/transaction_loading_screen.dart';
import 'package:blockchain_app/app/shared/ui/app_colors.dart';
import 'package:blockchain_app/app/shared/ui/app_divider.dart';
import 'package:blockchain_app/app/shared/ui/app_icons.dart';
import 'package:blockchain_app/app/shared/utils/sized_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:toastification/toastification.dart';

class TezosTransactionScreen extends StatelessWidget {
  const TezosTransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TransactionCubit()..fetchTezosBloc(),
      child: const TransactionsView(),
    );
  }
}

class TransactionsView extends StatelessWidget {
  const TransactionsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TransactionCubit, TransactionState>(
      listener: (context, state) {
        state.maybeMap(
          failed: (fail) {
            context.pop();
            Toastification().show(
              context: context,
              style: ToastificationStyle.minimal,
              type: ToastificationType.error,
              title: Text(fail.errorMessage),
            );
          },
          orElse: () {},
        );
      },
      builder: (context, state) {
        return Stack(
          children: [
            state.maybeMap(
              successTezos: (response) {
                return _Transactions(response.tezosBlocksResponse);
              },
              loading: (loading) {
                return TransactionLoadingScreen(
                  loadingDesc: loading.loadingMessage,
                );
              },
              orElse: () {
                return Container();
              },
            ),
          ],
        );
      },
    );
  }
}

class _Transactions extends StatelessWidget {
  const _Transactions(
    this.transactions,
  );

  final List<TezosBlocksResponse> transactions;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionCubit, TransactionState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            centerTitle: true,
            title: const Text('Tezos transactions'),
            titleTextStyle: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
            leading: InkWell(
              onTap: () => context.pop(),
              child: SvgPicture.asset(
                AppIcons.back,
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
          body: ListView.builder(
            shrinkWrap: true,
            itemCount: transactions.length,
            itemBuilder: (context, index) {
              final transaction = transactions[index];
              return TransactionTile(transaction: transaction);
            },
          ),
        );
      },
    );
  }
}

class TransactionTile extends StatelessWidget {
  const TransactionTile({
    required this.transaction,
    super.key,
  });

  final TezosBlocksResponse transaction;

  @override
  Widget build(BuildContext context) {
    final formattedTime = DateFormat('yyyy-MM-dd • HH:mm').format(
      DateTime.parse(transaction.timestamp),
    );
    return InkWell(
      onTap: () => context.push('/tezosTransactionDetails', extra: transaction),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                  width: context.width * 0.8,
                  child: Text(
                    transaction.hash,
                    style: const TextStyle(
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                const Spacer(),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 14,
                  color: AppColors.black.withOpacity(0.6),
                ),
              ],
            ),
            Text(
              formattedTime,
              style: const TextStyle(),
            ),
            const AppDivider(),
          ],
        ),

        // ch Text(transaction.hash),
        // trailing: const Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
