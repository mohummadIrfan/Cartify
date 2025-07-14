import 'package:ecommerce_api_app/controllers/auth_controller.dart';
import 'package:ecommerce_api_app/controllers/visiblePasswordController.dart';
import 'package:ecommerce_api_app/utlis/colors.dart';
import 'package:ecommerce_api_app/utlis/images.dart';
import 'package:ecommerce_api_app/view/widgets/custom_elevated_button.dart';
import 'package:ecommerce_api_app/view/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class ResetPasswordScreen extends StatelessWidget {
  final String email;
  ResetPasswordScreen({super.key, required this.email});
  AuthController authController = Get.put(AuthController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpasswordController =
      TextEditingController();
  final PasswordVisibilityController controller = Get.put(
    PasswordVisibilityController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0.w),
          child: Form(
            key: _formKey, // ✅ Wrap with Form
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
                  'Reset Password',
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
                Text(
                  'Password',
                  style: GoogleFonts.inter(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.blackColor,
                  ),
                ),
                SizedBox(height: 5.h),
                Obx(() {
                  return CustomTextField(
                    height: 48.h,
                    controller: passwordController,
                    obscureText: !controller.isPasswordVisible.value,
                    hintText: "*******",
                    prefixIcon: Image.asset(AppImages.passwordIcon),
                    //AppImages.passwordIcon,
                    hintColor: AppColors.blackColor,
                    fillColor: AppColors.whiteColor,
                    suffixIcon: Icon(
                      controller.isPasswordVisible.value
                          ? Icons.visibility
                          : Icons.visibility_off,
                      size: 16,
                    ),
                    // controller.isPasswordVisible.value
                    //     ? AppImages.eyeoffIcon
                    //     : AppImages.eyeoffIcon,
                    onSuffixIconTap: controller.togglePasswordVisibility,
                    borderColor: AppColors.lightgreyColor,
                    keyboardType: TextInputType.visiblePassword,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password is required';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      if (!RegExp(r'[A-Z]').hasMatch(value)) {
                        return 'Password must include at least one uppercase letter';
                      }
                      if (!RegExp(
                        r'[!@#\$&*~%^()_+=|<>?{}\[\]\-]',
                      ).hasMatch(value)) {
                        return 'Password must include at least one special character';
                      }
                      return null;
                    },
                  );
                }),

                SizedBox(height: 4.h),
                Text(
                  'Confirm Password',
                  style: GoogleFonts.inter(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.blackColor,
                  ),
                ),
                SizedBox(height: 5.h),
                Obx(() {
                  return CustomTextField(
                    height: 48.h,
                    controller: confirmpasswordController,
                    obscureText: !controller.isConfirmPasswordVisible.value,
                    hintText: "*******",
                    prefixIcon: Image.asset(AppImages.passwordIcon),
                    //AppImages.passwordIcon,
                    hintColor: AppColors.blackColor,
                    fillColor: AppColors.whiteColor,
                    suffixIcon: Icon(
                      controller.isConfirmPasswordVisible.value
                          ? Icons.visibility
                          : Icons.visibility_off,
                      size: 16,
                    ),
                    // controller.isConfirmPasswordVisible.value
                    //     ? AppImages.eyeoffIcon
                    //     : AppImages.eyeoffIcon,
                    onSuffixIconTap: controller.toggleConfirmPasswordVisibility,
                    borderColor: AppColors.lightgreyColor,
                    keyboardType: TextInputType.visiblePassword,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Confirm Password is required';
                      }
                      if (value != passwordController.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                  );
                }),

                SizedBox(height: 30.h),
                CustomButton(
                  height: 48.h,
                  width: 330.w,
                  text: 'Continue',
                  bgColor: AppColors.yellowColor,
                  textColor: AppColors.blackColor,
                  radius: 12,
                  isGradient: false,
                  onclick: () {
                    if (_formKey.currentState!.validate()) {
                      authController.resetPassword(
                        context: context,
                        email: email,
                        newPassword: passwordController.text,
                        confirmNewPassword: confirmpasswordController.text,
                      );
                      // Get.to(() => BackToLoginScreen());
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
