import 'package:chat_app/presentation/widgets/image/custom_svg_icon.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../text/text_widget.dart';

class CustomButton extends StatelessWidget {
  final Color bgColor, iconColor;
  final String title;
  final String imagePath;
  final VoidCallback onTap;

  const CustomButton(
      {super.key,
      this.bgColor = AppColors.primaryColor,
      required this.title,
      required this.onTap,
      this.imagePath = "",
      this.iconColor = AppColors.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.transparent,
      child: Container(
        padding: EdgeInsets.all(14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: bgColor,
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              imagePath != ""
                  ? CustomSvgIcon(
                      assetName: imagePath,
                      color: AppColors.backgroundColor,
                    )
                  : SizedBox.shrink(),
              imagePath != ""
                  ? SizedBox(
                      width: 15,
                    )
                  : SizedBox.shrink(),
              TextWidget(
                title: title,
                fontSize: 14,
                fontWeight: FontWeight.w500,
                textColor: AppColors.backgroundColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
