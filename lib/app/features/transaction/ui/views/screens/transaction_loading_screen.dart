import 'package:blockchain_app/app/shared/ui/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gap/gap.dart';

class TransactionLoadingScreen extends StatelessWidget {
  const TransactionLoadingScreen({
    this.loadingDesc,
    super.key,
  });

  final String? loadingDesc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SpinKitFadingCircle(
            color: AppColors.green,
          ),
          const Gap(10),
          if (loadingDesc != null) ...[
            Text(loadingDesc!),
          ] else ...[
            const SizedBox.shrink(),
          ],
        ],
      ),
    );
  }
}
