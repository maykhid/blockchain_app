import 'package:blockchain_app/app/shared/ui/app_colors.dart';
import 'package:flutter/material.dart';

class AppTextStyles {
  static TextStyle semiBoldGreen = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.green,
  );
  static TextStyle semiBoldBlack = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.black,
  );

  static TextStyle normal = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.black,
  );

  static TextStyle smallGrey = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.black.withOpacity(0.6),
  );

  static TextStyle smallBlack = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.black,
  );

  static TextStyle largeBoldBlack = const TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    color: AppColors.black,
  );

  static TextStyle smallBoldBlack = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: AppColors.black,
  );

  static TextStyle smallGreen = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.green,
  );

  static TextStyle smallRed = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.red,
  );
}
