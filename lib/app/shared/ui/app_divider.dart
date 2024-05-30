import 'package:blockchain_app/app/shared/ui/app_colors.dart';
import 'package:flutter/material.dart';

class AppDivider extends StatelessWidget {
  const AppDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: 1,
      color: AppColors.black.withOpacity(0.1),
    );
  }
}
