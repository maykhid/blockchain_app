import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    required this.text,
    this.icon,
    this.onPressed,
    this.backgroundColor,
    this.disabledBackgroundColor,
    this.width,
    this.height,
    this.borderRadius,
    this.isLoading = false,
    super.key,
  });

  final String text;
  final Color? backgroundColor;
  final double? width;
  final double? height;
  final double? borderRadius;
  final Widget? icon;
  final bool isLoading;
  final Color? disabledBackgroundColor;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: icon ??
          const SizedBox.square(
            dimension: 0,
          ),
      label: isLoading
          ? const CupertinoActivityIndicator(
              color: Colors.white,
            )
          : Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
      style: ElevatedButton.styleFrom(
        fixedSize: Size(width ?? 240, height ?? 50),
           disabledBackgroundColor:
            disabledBackgroundColor ?? backgroundColor?.withOpacity(0.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            borderRadius ?? 8,
          ), // Set border radius here
        ),
        backgroundColor: backgroundColor ??
            Colors.black, // Change the color for Google button
      ),
    );
  }
}
