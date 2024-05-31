import 'package:blockchain_app/app/features/transaction/data/model/raw_block_response.dart';
import 'package:blockchain_app/app/shared/ui/app_divider.dart';
import 'package:blockchain_app/app/shared/ui/app_icons.dart';
import 'package:blockchain_app/app/shared/ui/app_text_styles.dart';
import 'package:blockchain_app/app/shared/utils/sized_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class TransactionDetailsScreen extends StatelessWidget {
  const TransactionDetailsScreen({
    required this.transaction,
    super.key,
  });

  final Tx transaction;

  @override
  Widget build(BuildContext context) {
    final formattedTime = DateFormat('yyyy-MM-dd • HH:mm').format(
      DateTime.fromMillisecondsSinceEpoch(transaction.time, isUtc: true),
    );

    final receivedTime = DateFormat('yyyy-MM-dd • HH:mm').format(
      DateTime.fromMillisecondsSinceEpoch(transaction.lockTime, isUtc: true),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text('Transaction details'),
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
          child: Column(
            children: [
              // hash
              TransactionDetailsTile(
                title: 'Hash',
                info: transaction.hash,
              ),
              const AppDivider(),

              // time
              TransactionDetailsTile(
                title: 'Time',
                info: formattedTime,
              ),
              const AppDivider(),

              // size
              TransactionDetailsTile(
                title: 'Size',
                info: transaction.size.toString(),
              ),
              const AppDivider(),

              // block
              TransactionDetailsTile(
                title: 'Block Index',
                info: transaction.blockIndex.toString(),
              ),
              const AppDivider(),

              // block height
              TransactionDetailsTile(
                title: 'Block Height',
                info: transaction.blockHeight.toString(),
              ),
              const AppDivider(),

              // received time
              TransactionDetailsTile(
                title: 'Received Time',
                info: receivedTime,
              ),

              const Gap(20),

              // view on explorer
              ListTile(
                onTap: () {},
                contentPadding: EdgeInsets.zero,
                title: Row(
                  children: [
                    SvgPicture.asset(
                      AppIcons.export,
                      fit: BoxFit.scaleDown,
                    ),
                    const Gap(15),
                    Text(
                      'View on blockchain explorer',
                      style: AppTextStyles.normal,
                    ),
                  ],
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 17,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TransactionDetailsTile extends StatelessWidget {
  const TransactionDetailsTile({
    required this.info,
    required this.title,
    super.key,
  });

  final String info;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTextStyles.smallGrey,
          ),
          SizedBox(
            width: context.width * 0.6,
            child: Text(
              info,
              style: AppTextStyles.normal,
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}
