import 'package:ecommerce_api_app/controllers/auth_controller.dart';
import 'package:ecommerce_api_app/controllers/otp_controller.dart';
import 'package:ecommerce_api_app/controllers/time_controller.dart';
import 'package:ecommerce_api_app/utlis/colors.dart';
import 'package:ecommerce_api_app/utlis/images.dart';
import 'package:ecommerce_api_app/view/widgets/custom_elevated_button.dart';
import 'package:ecommerce_api_app/view/widgets/otp_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class OtpVerificationScreen extends StatelessWidget {
  final String email;
  AuthController authController = Get.put(AuthController());
  final timerController = TimerController.create();
  // ← Added this

  OtpVerificationScreen({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OtpController(email));
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 73.h),
              InkWell(
                onTap: () => Get.back(),
                child: Image.asset(
                  AppImages.leftarrow,
                  height: 24.h,
                  width: 24.w,
                ),
              ),
              SizedBox(height: 30.h),
              Text(
                'OTP Verification',
                style: GoogleFonts.inter(
                  fontSize: 32.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.blackColor,
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                "A 4-digit code was sent to \n$email",
                style: GoogleFonts.inter(
                  color: AppColors.blackColor,
                  fontSize: 14.sp,
                ),
              ),
              SizedBox(height: 50.h),

              /// OTP Row
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OTPInputField(
                    controller: controller.pinPutControllers[0],
                    focusNode: controller.focusNodes[0],
                    nextFocusNode: controller.focusNodes[1],
                  ),
                  SizedBox(width: 8.w),
                  OTPInputField(
                    controller: controller.pinPutControllers[1],
                    focusNode: controller.focusNodes[1],
                    nextFocusNode: controller.focusNodes[2],
                    prevFocusNode: controller.focusNodes[0],
                  ),
                  SizedBox(width: 8.w),
                  OTPInputField(
                    controller: controller.pinPutControllers[2],
                    focusNode: controller.focusNodes[2],
                    nextFocusNode: controller.focusNodes[3],
                    prevFocusNode: controller.focusNodes[1],
                  ),
                  SizedBox(width: 8.w),
                  OTPInputField(
                    controller: controller.pinPutControllers[3],
                    focusNode: controller.focusNodes[3],
                    prevFocusNode: controller.focusNodes[2],
                  ),
                ],
              ),

              SizedBox(height: 10.h),
              Row(
                children: [
                  Obx(
                    () => InkWell(
                      onTap: () async {
                        if (timerController.secondRemaining.value == 0) {
                          await controller.sendOtp(
                            email: email,
                            context: context,
                          );
                          timerController.secondRemaining.value = 60;
                          timerController.onInit();
                        }
                      },
                      child: Text(
                        'Resend Code?',
                        style: GoogleFonts.inter(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color:
                              timerController.secondRemaining.value == 0
                                  ? AppColors.blackColor
                                  : AppColors.blackColor.withValues(alpha: 0.2),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 5.w),
                  Obx(
                    () => Text(
                      '00 : ${timerController.secondRemaining.value < 10 ? "0${timerController.secondRemaining.value}" : timerController.secondRemaining.value}',
                      style: GoogleFonts.inter(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.blackColor,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20.h),
              CustomButton(
                height: 50.h,
                width: 330.w,
                text: 'Verify',
                bgColor: AppColors.yellowColor,
                textColor: AppColors.blackColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                onclick: () {
                  controller.verifyOtp();

                  debugPrint("Otp is : ${controller.getOTP()}");
                  // Validate and proceed
                  // Get.to(ResetPasswordScreen());
                },
                radius: 12,
                isGradient: false,
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
