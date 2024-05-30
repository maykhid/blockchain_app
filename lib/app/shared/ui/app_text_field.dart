import 'package:blockchain_app/app/shared/ui/app_colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppTextField extends StatelessWidget {
  AppTextField({
    this.controller,
    super.key,
    this.hintText,
    this.prefixIcon,
    this.obscureText = false,
    this.validate,
    this.textInputType = TextInputType.text,
    this.textInputAction,
    this.maxLines,
    this.onSaved,
    this.onTap,
    this.labelText,
    this.readOnly = false,
    this.suffixIcon,
    this.onChanged,
    this.errorText,
    this.initialValue,
  });
  final String? hintText;
  final String? labelText;
  final Widget? prefixIcon;
  final TextEditingController? controller;
  final int? maxLines;
  final Widget? suffixIcon;
  final bool obscureText;
  String? Function(String?)? validate;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final void Function(String?)? onSaved;
  final VoidCallback? onTap;
  final bool readOnly;
  final void Function(String?)? onChanged;
  final String? errorText;
  final String? initialValue;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      cursorColor: AppColors.lightBlue,
      obscureText: obscureText,
      validator: validate,
      maxLines: obscureText == true ? 1 : maxLines,
      keyboardType: textInputType,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        hintText: hintText,
        labelText: labelText,
        hintStyle: const TextStyle(color: Colors.grey),
        suffixIcon: suffixIcon,
        // filled: true,
        errorText: errorText,
        disabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        errorBorder: const OutlineInputBorder(
          // borderRadius: BorderRadius.zero,
          borderSide: BorderSide(
            color: Colors.red,
          ),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),

        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),

        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(width: 0.5, color: Colors.red),
        ),
      ),
      onChanged: onChanged,
      onSaved: onSaved,
      controller: controller,
      onTap: onTap,
      readOnly: readOnly,
    );
  }
}
