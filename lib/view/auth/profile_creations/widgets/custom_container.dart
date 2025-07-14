import 'package:ecommerce_api_app/controllers/progress_controller.dart';
import 'package:ecommerce_api_app/utlis/colors.dart';
import 'package:ecommerce_api_app/utlis/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

final ProgressController controller =
    Get.isRegistered<ProgressController>()
        ? Get.find<ProgressController>()
        : Get.put(ProgressController());
Widget buildSelectableTile({required String title, required int index}) {
  return Obx(() {
    bool isSelected = controller.selectedIndexes.contains(index);

    return GestureDetector(
      onTap: () => controller.toggleSelect(index),
      child: Container(
        width: 330.w,
        height: 53.h,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.lightyellowColor : AppColors.whiteColor,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color:
                isSelected ? AppColors.yellowColor : AppColors.lightgreyColor,
            width: 1.w,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: GoogleFonts.inter(
                fontSize: 14.sp,
                color: isSelected ? AppColors.blackColor : AppColors.greyColor,
                fontWeight: FontWeight.w400,
              ),
            ),
            if (isSelected)
              Row(
                children: [
                  SizedBox(width: 6.w),
                  Image.asset(AppImages.tickIcon, height: 12.h, width: 12.w),
                ],
              ),
          ],
        ),
      ),
    );
  });
}
