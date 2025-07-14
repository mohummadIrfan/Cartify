import 'package:ecommerce_api_app/utlis/colors.dart';
import 'package:ecommerce_api_app/utlis/images.dart';
import 'package:ecommerce_api_app/view/auth/login/login_screen.dart';
import 'package:ecommerce_api_app/view/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class BackToLoginScreen extends StatelessWidget {
  const BackToLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(AppImages.successfull, height: 124.h, width: 124.w),

                SizedBox(height: 30.h),

                Text(
                  'Successful!',
                  style: GoogleFonts.inter(
                    fontSize: 32.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.blackColor,
                  ),
                ),

                SizedBox(height: 10.h),

                Text(
                  "Your password has been reset successfully.\nYou can now continue.",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    color: AppColors.blackColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                SizedBox(height: 40.h),

                CustomButton(
                  height: 48.h,
                  width: 330.w,
                  text: 'Back to Log In',
                  bgColor: AppColors.yellowColor,
                  textColor: AppColors.blackColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  onclick: () {
                    // Add navigation logic here
                    Get.to(LoginScreen());
                  },
                  radius: 12,
                  isGradient: false,
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
