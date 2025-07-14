import 'dart:async';

import 'package:ecommerce_api_app/utlis/colors.dart';
import 'package:ecommerce_api_app/utlis/images.dart';
import 'package:ecommerce_api_app/view/onBoarding/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 4), () {
      Get.off(() => OnboardingScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.whiteColor, // Set background color here
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                AppImages.splashLogo, // Load logo from assets
                width: 316.w,
                height: 38.h,
                fit: BoxFit.contain,
              ),
              SizedBox(height: 10.h),
              Text(
                'Connecting educational institutions \nwith qualified professionals',
                textAlign: TextAlign.center, // ✅ Center-aligns the text
                style: GoogleFonts.inter(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.blackColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
