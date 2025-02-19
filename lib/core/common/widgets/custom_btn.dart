import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../theme/app_colors.dart';
import '../../utils/app_styles.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  final Color? backgroundColor;
  final double? height;
  final double? width;
  final TextStyle? textStyle;
  final BorderRadius? borderRadius;
  final bool? isLoading;
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.height,
    this.width,
    this.textStyle,
    this.borderRadius,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 16.h),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          height: height ?? 45.h,
          width: width ?? 230.59.w,
          decoration: BoxDecoration(
              color: backgroundColor ?? AppColors.primaryColor,
              borderRadius: borderRadius ?? BorderRadius.circular(10),
              border: Border.all(
                color: AppColors.primaryColor,
              )),
          child: Center(
            child: (isLoading ?? false)
                ? const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  )
                : Text(text,
                    style: textStyle ??
                        AppStyles.s16.copyWith(
                          color: AppColors.white,
                          fontWeight: FontWeight.w700,
                        )),
          ),
        ),
      ),
    );
  }
}
