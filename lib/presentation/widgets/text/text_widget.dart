import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_strings.dart';

class TextWidget extends StatelessWidget {
  final String title, fontFamily;
  final Color textColor;
  final double fontSize;
  final FontWeight fontWeight;
  final TextDecoration textDecoration;

  final Color underLineColor;
  final TextAlign textAlign;
  final TextOverflow? textOverflow;
  final int? maxLines;

  const TextWidget({
    super.key,
    required this.title,
    this.textColor = AppColors.textColor,
    this.fontSize = 15,
    this.fontWeight = FontWeight.w500,
    this.textDecoration = TextDecoration.none,
    this.textAlign = TextAlign.center,
    this.underLineColor = AppColors.primaryColor,
    this.textOverflow,
    this.fontFamily = AppStrings.fontSanFrancisco,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title.tr,
      textAlign: textAlign,
      overflow:
          textOverflow ?? TextOverflow.clip, // Default to clip if not provided
      softWrap: true,
      maxLines: maxLines, // Set max lines
      style: TextStyle(
        fontFamily: fontFamily,
        color: textColor,
        fontSize: fontSize,
        fontWeight: fontWeight,
        decorationColor: underLineColor,
        decoration: textDecoration,
      ),
    );
  }
}
