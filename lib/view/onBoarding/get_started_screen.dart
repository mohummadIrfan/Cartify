import 'package:ecommerce_api_app/utlis/colors.dart';
import 'package:ecommerce_api_app/utlis/images.dart';
import 'package:ecommerce_api_app/view/auth/login/login_screen.dart';
import 'package:ecommerce_api_app/view/auth/profile_creations/create_account_screen.dart';
import 'package:ecommerce_api_app/view/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 90.h),
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                AppImages.splashLogo,
                width: 231.w,
                height: 28.h,
              ),
            ),

            SizedBox(height: 124.h),
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                AppImages.startImg,
                width: 327.w,
                height: 191.h,
              ),
            ),

            SizedBox(height: 71.h),
            Text(
              'Get Started Today!',
              textAlign: TextAlign.center, // ✅ Center-aligns the text
              style: GoogleFonts.inter(
                fontSize: 30.sp,
                fontWeight: FontWeight.w800,
                color: AppColors.blackColor,
              ),
            ),

            SizedBox(height: 20.h),
            Text(
              "Whether you're hiring or looking for work, \nNachtwacht is your gateway to trusted \neducational partnerships.",
              textAlign: TextAlign.center, // ✅ Center-aligns the text
              style: GoogleFonts.inter(
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.blackColor,
              ),
            ),
            SizedBox(height: 50.h),
            CustomButton(
              height: 48.h,
              width: 327.w,
              radius: 12.r,
              bgColor: AppColors.blackColor,
              textColor: AppColors.whiteColor,
              text: 'Log In',
              fontWeight: FontWeight.w600,
              fontSize: 14.sp,
              onclick: () {
                Get.to(LoginScreen());
              },
              isGradient: false,
            ),
            SizedBox(height: 10.h),
            CustomButton(
              height: 48.h,
              width: 327.w,
              radius: 12.r,
              bgColor: AppColors.yellowColor,
              textColor: AppColors.blackColor,
              text: 'Create Account',
              fontWeight: FontWeight.w500,
              fontSize: 14.sp,
              onclick: () {
                Get.to(SignUpScreen());
              },
              isGradient: false,
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
