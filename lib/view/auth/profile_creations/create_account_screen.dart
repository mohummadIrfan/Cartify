import 'package:ecommerce_api_app/controllers/auth_controller.dart';
import 'package:ecommerce_api_app/controllers/visiblePasswordController.dart';
import 'package:ecommerce_api_app/utlis/colors.dart';
import 'package:ecommerce_api_app/utlis/images.dart';
import 'package:ecommerce_api_app/view/auth/login/login_screen.dart';
import 'package:ecommerce_api_app/view/widgets/custom_elevated_button.dart';
import 'package:ecommerce_api_app/view/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final _formKey = GlobalKey<FormState>(); // ✅ GlobalKey for Form
  final AuthController authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    final PasswordVisibilityController controller = Get.put(
      PasswordVisibilityController(),
    );

    final TextEditingController nameController = TextEditingController();
    final TextEditingController confirmpasswordController =
        TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.0.w),
          child: Form(
            key: _formKey, // ✅ Attach form key here
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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

                SizedBox(height: 71.h),
                Text(
                  'Create Account',
                  style: GoogleFonts.inter(
                    fontSize: 32.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.blackColor,
                  ),
                ),
                SizedBox(height: 20.h),
                Text(
                  "Enter your details to create a new account",
                  style: GoogleFonts.inter(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.greyColor,
                  ),
                ),
                SizedBox(height: 50.h),

                /// Name
                Text('Name', style: _labelStyle()),
                SizedBox(height: 5.h),
                CustomTextField(
                  height: 46.h,
                  controller: nameController,
                  hintText: "Example",
                  hintColor: AppColors.blackColor,
                  borderColor: AppColors.yellowColor,
                  fillColor: AppColors.whiteColor,
                  prefixIcon: Image.asset(AppImages.emailIcon),
                  // AppImages.emailIcon,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Name is required';
                    }
                    return null;
                  },
                ),

                SizedBox(height: 10.h),

                /// Email
                Text('Email', style: _labelStyle()),
                SizedBox(height: 5.h),
                CustomTextField(
                  height: 46.h,
                  controller: emailController,
                  hintText: "example123@gmail.com",
                  hintColor: AppColors.blackColor,
                  borderColor: AppColors.lightgreyColor,
                  fillColor: AppColors.whiteColor,
                  prefixIcon: Image.asset(AppImages.emailIcon),
                  // AppImages.emailIcon,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Email is required';
                    }
                    if (!value.contains('@')) {
                      return 'Enter a valid email address';
                    }
                    return null;
                  },
                ),

                SizedBox(height: 10.h),

                /// Password
                Text('Password', style: _labelStyle()),
                SizedBox(height: 5.h),
                Obx(
                  () => CustomTextField(
                    height: 46.h,
                    controller: passwordController,
                    hintText: "*******",
                    obscureText: !controller.isPasswordVisible.value,
                    hintColor: AppColors.blackColor,
                    borderColor: AppColors.lightgreyColor,
                    fillColor: AppColors.whiteColor,
                    prefixIcon: Image.asset(AppImages.passwordIcon),

                    // AppImages.passwordIcon,
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
                  ),
                ),

                SizedBox(height: 10.h),

                /// Confirm Password
                Text('Confirm Password', style: _labelStyle()),
                SizedBox(height: 5.h),
                Obx(
                  () => CustomTextField(
                    height: 46.h,
                    controller: confirmpasswordController,
                    hintText: "*******",
                    obscureText: !controller.isConfirmPasswordVisible.value,
                    hintColor: AppColors.blackColor,
                    borderColor: AppColors.lightgreyColor,
                    fillColor: AppColors.whiteColor,
                    prefixIcon: Image.asset(AppImages.passwordIcon),
                    //    AppImages.passwordIcon,
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
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please confirm your password';
                      }
                      if (value != passwordController.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                  ),
                ),

                SizedBox(height: 25.h),

                /// Sign Up Button
                CustomButton(
                  height: 48.h,
                  width: 327.w,
                  radius: 10.r,
                  bgColor: AppColors.yellowColor,
                  textColor: AppColors.blackColor,
                  text: 'Sign Up',
                  fontWeight: FontWeight.w600,
                  fontSize: 14.sp,
                  onclick: () {
                    if (_formKey.currentState!.validate()) {
                      authController.SignupUser(
                        email: emailController.text,
                        context: context,
                        fullname: nameController.text,
                        password: passwordController.text,
                      );
                      // Get.to(ProfileCreationScreen());
                    }
                  },
                  isGradient: false,
                ),

                SizedBox(height: 35.h),

                /// Login Link
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?',
                      style: GoogleFonts.inter(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.greyColor,
                      ),
                    ),
                    SizedBox(width: 4.w),
                    Padding(
                      padding: EdgeInsets.only(right: 30.0.w),
                      child: InkWell(
                        onTap: () {
                          Get.to(LoginScreen());
                        },
                        child: Text(
                          'Log in',
                          style: GoogleFonts.inter(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.blackColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextStyle _labelStyle() => GoogleFonts.inter(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.blackColor,
  );
}
