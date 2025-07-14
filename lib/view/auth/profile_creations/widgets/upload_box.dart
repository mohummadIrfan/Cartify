import 'package:dotted_border/dotted_border.dart';
import 'package:ecommerce_api_app/utlis/colors.dart';
import 'package:ecommerce_api_app/utlis/images.dart';
import 'package:ecommerce_api_app/view/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UploadBox extends StatelessWidget {
  const UploadBox({super.key});

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      color: AppColors.blackColor,
      strokeWidth: 1,
      dashPattern: [7, 5], // height 5, space 5
      borderType: BorderType.RRect,
      radius: Radius.circular(12.r),
      child: Container(
        width: 330.w,
        height: 132.h,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppImages.uploadFile, height: 40.h, width: 40.w),
            SizedBox(height: 10.h),
            CustomButton(
              height: 30.h,
              width: 95.w,
              radius: 8.r,
              bgColor: AppColors.blackColor,
              textColor: AppColors.whiteColor,
              text: 'Browse files',
              fontWeight: FontWeight.w600,
              fontSize: 14.sp,
              onclick: () {},
              isGradient: false,
            ),
          ],
        ),
      ),
    );
  }
}
