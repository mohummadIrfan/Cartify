import 'package:ecommerce_api_app/controllers/auth_controller.dart';
import 'package:ecommerce_api_app/utlis/colors.dart';
import 'package:ecommerce_api_app/utlis/images.dart';
import 'package:ecommerce_api_app/view/widgets/custom_elevated_button.dart';
import 'package:ecommerce_api_app/view/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});
  final AuthController authController = Get.put(AuthController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0.w),
          child: Form(
            key: _formKey, // ✅ Wrap in Form
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 73.h),

                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Image.asset(
                    AppImages.leftarrow,
                    height: 24.h,
                    width: 24.w,
                  ),
                ),
                SizedBox(height: 30.h),
                Text(
                  'Forgot Password?',
                  style: GoogleFonts.inter(
                    fontSize: 32.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.blackColor,
                  ),
                ),

                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Enter your Email below.",
                      style: GoogleFonts.inter(
                        color: AppColors.blackColor,
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 40.h),
                Text(
                  'Email',
                  style: GoogleFonts.inter(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.blackColor,
                  ),
                ),
                SizedBox(height: 5.h),
                CustomTextField(
                  height: 48.h,
                  controller: authController.emailController,
                  prefixIcon: Image.asset(AppImages.emailIcon),
                  hintText: "hello@example.com",
                  hintColor: AppColors.blackColor,
                  fillColor: AppColors.whiteColor,
                  borderColor: AppColors.lightgreyColor,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email is required';
                    }
                    if (!value.contains('@') || !value.contains('.')) {
                      return 'Enter a valid email';
                    }
                    return null;
                  },
                ),

                SizedBox(height: 20.h),
                CustomButton(
                  height: 50.h,
                  width: 330.w,
                  text: 'Send OTP',
                  bgColor: AppColors.yellowColor,
                  textColor: AppColors.blackColor,
                  radius: 12,
                  isGradient: false,
                  onclick: () {
                    if (_formKey.currentState!.validate()) {
                      authController.forgetPassword(
                        email: authController.emailController.text,
                        context: context,
                      );
                      // Get.to(
                      //   OtpVerificationScreen(
                      //     email: emailController.text.trim(),
                      //   ),
                      //);
                    }
                  },
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
