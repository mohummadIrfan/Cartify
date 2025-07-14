import 'package:ecommerce_api_app/utlis/colors.dart';
import 'package:ecommerce_api_app/utlis/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SucessfullcreationScreen extends StatelessWidget {
  const SucessfullcreationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 60.h),
            Padding(
              padding: EdgeInsets.only(left: 20.0.w),
              child: Image.asset(
                AppImages.succesfullCreations,
                height: 290.h,
                width: 290.w,
              ),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
