import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final int minLine;
  final int maxLine;
  final TextEditingController? controller;
  final bool isObscure;
  final Widget? suffixIcon;
  const CustomTextField(
      {super.key,
      required this.hintText,
      this.controller,
      this.minLine = 1,
      this.maxLine = 1,
      this.isObscure = false,
      this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isObscure,
      controller: controller,
      minLines: minLine,
      maxLines: maxLine,
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey.shade200,
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12), // Same rounded corners
            borderSide: BorderSide(
              color: AppColors.greyColor.withValues(alpha: 0.5),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: AppColors.primaryColor,
              width: 2,
            ),
          ),
          suffixIcon: suffixIcon),
    );
  }
}
