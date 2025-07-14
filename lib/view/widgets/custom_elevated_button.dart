import 'package:ecommerce_api_app/utlis/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final String? text;
  final String? imagePath;
  final bool isGradient;
  final Color? bgColor;
  final Color? textColor;
  final Color? borderColor;
  final FontWeight? fontWeight;
  final double? fontSize;
  final double? radius;
  final double? width;
  final double? height;
  final VoidCallback? onclick;

  const CustomButton({
    super.key,
    this.text,
    this.imagePath,
    required this.isGradient,
    this.bgColor,
    this.textColor,
    this.borderColor,
    this.fontSize,
    this.radius,
    this.width,
    this.height,
    this.onclick,
    this.fontWeight,
  });

  @override
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onclick ?? () => print('Tapped'),
      child: Container(
        height: height ?? 52.h,
        width: width ?? double.infinity,
        decoration: BoxDecoration(
          color: isGradient ? null : bgColor ?? AppColors.primaryColor,
          border: Border.all(color: borderColor ?? Colors.transparent),
          borderRadius: BorderRadius.circular(radius ?? 32.0.r),
          // gradient: isGradient ? AppColors.linearGradient : null,
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (imagePath != null && imagePath!.isNotEmpty) ...[
                Image.asset(
                  imagePath!,
                  height: 18.h,
                  width: 18.w, // Optional: adjust size
                ),
                SizedBox(width: 12.w),
              ],
              Text(
                text ?? '',
                style: GoogleFonts.inter(
                  color: textColor ?? AppColors.whiteColor,
                  fontSize: fontSize ?? 16.sp,
                  fontWeight: fontWeight ?? FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
