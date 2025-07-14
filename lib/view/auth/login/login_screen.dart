import 'package:ecommerce_api_app/controllers/auth_controller.dart';
import 'package:ecommerce_api_app/controllers/visiblePasswordController.dart';
import 'package:ecommerce_api_app/utlis/colors.dart';
import 'package:ecommerce_api_app/utlis/images.dart';
import 'package:ecommerce_api_app/view/auth/login/forget_password_screen.dart';
import 'package:ecommerce_api_app/view/auth/profile_creations/create_account_screen.dart';
import 'package:ecommerce_api_app/view/widgets/custom_elevated_button.dart';
import 'package:ecommerce_api_app/view/widgets/custom_text_field.dart';
import 'package:ecommerce_api_app/view/widgets/or_dividerWidgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final PasswordVisibilityController controller = Get.put(
      PasswordVisibilityController(),
    );
    final AuthController authController = Get.put(AuthController());
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final _formKey = GlobalKey<FormState>(); // ✅ Form key added

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.0.w),
          child: Form(
            key: _formKey, // ✅ Attach form key
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
                  'LogIn',
                  style: GoogleFonts.inter(
                    fontSize: 32.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.blackColor,
                  ),
                ),
                SizedBox(height: 20.h),
                Text(
                  "Enter your email and password to log in ",
                  style: GoogleFonts.inter(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.greyColor,
                  ),
                ),
                SizedBox(height: 30.h),
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
                  height: 46.h,
                  controller: emailController,
                  hintText: "example123@gmail.com",
                  hintColor: AppColors.blackColor,
                  borderColor: AppColors.yellowColor,
                  fillColor: AppColors.whiteColor,
                  prefixIcon: Image.asset(AppImages.emailIcon),
                  //AppImages.emailIcon,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email is required';
                    }
                    if (!value.contains('@')) {
                      return 'Enter a valid email';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    print("Email changed: $value");
                  },
                ),
                //SizedBox(height: 5.h),
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
                    height: 46.h,
                    controller: passwordController,
                    hintText: "*******",
                    obscureText: !controller.isPasswordVisible.value,
                    hintColor: AppColors.blackColor,
                    borderColor: AppColors.lightgreyColor,
                    fillColor: AppColors.whiteColor,
                    prefixIcon: Image.asset(AppImages.passwordIcon),
                    suffixIcon: Icon(
                      controller.isPasswordVisible.value
                          ? Icons.visibility
                          : Icons.visibility_off,
                      size: 16.r,
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

                    onChanged: (value) {
                      print("Password changed: $value");
                    },
                  );
                }),
                SizedBox(height: 4.h),
                Padding(
                  padding: EdgeInsets.only(right: 10.0.w),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () {
                        Get.to(ForgetPasswordScreen());
                      },
                      child: Text(
                        'Forgot Password?',
                        style: GoogleFonts.inter(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.blackColor,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 35.h),
                CustomButton(
                  height: 48.h,
                  width: 327.w,
                  radius: 10.r,
                  bgColor: AppColors.yellowColor,
                  textColor: AppColors.blackColor,
                  text: 'LogIn',
                  fontWeight: FontWeight.w600,
                  fontSize: 14.sp,
                  onclick: () {
                    if (_formKey.currentState!.validate()) {
                      authController.SigninUser(
                        context: context,
                        email: emailController.text,
                        password: passwordController.text,
                      );
                      //   Get.to(ClientBottomNavScreen());
                      print('Form is valid');
                      // Add login logic here
                    } else {
                      print('Validation failed');
                    }
                  },
                  isGradient: false,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 10.0.w),
                  child: OrDivider(),
                ),
                SizedBox(height: 20.h),
                CustomButton(
                  height: 48.h,
                  width: 327.w,
                  radius: 12.r,
                  imagePath: AppImages.googleIcon,
                  bgColor: AppColors.whiteColor,
                  borderColor: AppColors.greyColor1,
                  textColor: AppColors.blackColor,
                  text: 'Continue with Google',
                  fontWeight: FontWeight.w600,
                  fontSize: 14.sp,
                  onclick: () {},
                  isGradient: false,
                ),
                SizedBox(height: 20.h),
                CustomButton(
                  height: 48.h,
                  width: 327.w,
                  radius: 12.r,
                  imagePath: AppImages.facebookIcon,
                  bgColor: AppColors.whiteColor,
                  borderColor: AppColors.greyColor1,
                  textColor: AppColors.blackColor,
                  text: 'Continue with Facebook',
                  fontWeight: FontWeight.w600,
                  fontSize: 14.sp,
                  onclick: () {},
                  isGradient: false,
                ),
                SizedBox(height: 25.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don’t have an account?',
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
                          Get.to(SignUpScreen());
                        },
                        child: Text(
                          'Sign Up',
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
}

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:wacht/controllers/visiblePasswordController.dart';
// import 'package:wacht/utlis/colors.dart';
// import 'package:wacht/utlis/images.dart';
// import 'package:wacht/view/auth/login/forget_password_screen.dart';
// import 'package:wacht/view/auth/profile_creations/create_account_screen.dart';
// import 'package:wacht/widgets/custom_elevated_button.dart';
// import 'package:wacht/widgets/custom_text_field.dart';
// import 'package:wacht/widgets/or_dividerWidgets.dart';

// class LoginScreen extends StatelessWidget {
//   const LoginScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final PasswordVisibilityController controller = Get.put(
//       PasswordVisibilityController(),
//     );
//     final TextEditingController emailController = TextEditingController();
//     final TextEditingController passwordController = TextEditingController();
//     return Scaffold(
//       backgroundColor: AppColors.whiteColor,
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 30.0.w),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(height: 90.h),
//               Align(
//                 alignment: Alignment.center,
//                 child: Image.asset(
//                   AppImages.splashLogo,
//                   width: 231.w,
//                   height: 28.h,
//                 ),
//               ),

//               SizedBox(height: 71.h),
//               Text(
//                 'LogIn',
//                 //textAlign: TextAlign.center, // ✅ Center-aligns the text
//                 style: GoogleFonts.inter(
//                   fontSize: 32.sp,
//                   fontWeight: FontWeight.w700,
//                   color: AppColors.blackColor,
//                 ),
//               ),

//               SizedBox(height: 20.h),
//               Text(
//                 "Enter your email and password to log in ",
//                 // textAlign: TextAlign.center, // ✅ Center-aligns the text
//                 style: GoogleFonts.inter(
//                   fontSize: 14.sp,
//                   fontWeight: FontWeight.w500,
//                   color: AppColors.greyColor,
//                 ),
//               ),
//               SizedBox(height: 30.h),
//               Text(
//                 'Email',
//                 //textAlign: TextAlign.center, // ✅ Center-aligns the text
//                 style: GoogleFonts.inter(
//                   fontSize: 14.sp,
//                   fontWeight: FontWeight.w500,
//                   color: AppColors.blackColor,
//                 ),
//               ),

//               SizedBox(height: 5.h),
//               CustomTextField(
//                 height: 46.h,

//                 controller: emailController,
//                 hintText: "example123@gmail.com",
//                 hintColor: AppColors.blackColor,
//                 borderColor: AppColors.yellowColor,
//                 fillColor: AppColors.whiteColor,
//                 prefixIcon: AppImages.emailIcon,
//                 // provide asset
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Email is required';
//                   }
//                   if (!value.contains('@')) {
//                     return 'Enter a valid email';
//                   }
//                   return null;
//                 },
//                 onChanged: (value) {
//                   print("Email changed: $value");
//                 },
//               ),
//               SizedBox(height: 20.h),
//               Text(
//                 'Password',
//                 //textAlign: TextAlign.center, // ✅ Center-aligns the text
//                 style: GoogleFonts.inter(
//                   fontSize: 14.sp,
//                   fontWeight: FontWeight.w500,
//                   color: AppColors.blackColor,
//                 ),
//               ),

//               SizedBox(height: 5.h),
//               Obx(() {
//                 return CustomTextField(
//                   height: 46.h,

//                   controller: passwordController,
//                   hintText: "*******",
//                   obscureText: !controller.isPasswordVisible.value,
//                   hintColor: AppColors.blackColor,
//                   borderColor: AppColors.lightgreyColor,
//                   fillColor: AppColors.whiteColor,
//                   prefixIcon: AppImages.passwordIcon,
//                   suffixIcon:
//                       controller.isPasswordVisible.value
//                           ? AppImages.eyeoffIcon
//                           : AppImages.eyeoffIcon,
//                   onSuffixIconTap:
//                       controller.togglePasswordVisibility, // provide asset
//                   onChanged: (value) {
//                     print("Email changed: $value");
//                   },
//                 );
//               }),
//               SizedBox(height: 15.h),
//               Padding(
//                 padding: EdgeInsets.only(right: 10.0.w),
//                 child: Align(
//                   alignment: Alignment.centerRight,
//                   child: InkWell(
//                     onTap: () {
//                       Get.to(ForgetPasswordScreen());
//                     },
//                     child: Text(
//                       'Forgot Password?',
//                       style: GoogleFonts.inter(
//                         fontSize: 12.sp,
//                         fontWeight: FontWeight.w600,
//                         color: AppColors.blackColor,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),

//               SizedBox(height: 35.h),
//               CustomButton(
//                 height: 48.h,
//                 width: 327.w,
//                 radius: 10.r,
//                 bgColor: AppColors.yellowColor,
//                 textColor: AppColors.blackColor,
//                 text: 'LogIn',
//                 fontWeight: FontWeight.w600,
//                 fontSize: 14.sp,
//                 onclick: () {},
//                 isGradient: false,
//               ),

//               Padding(
//                 padding: EdgeInsets.only(right: 10.0.w),
//                 child: OrDivider(),
//               ),
//               SizedBox(height: 20.h),
//               CustomButton(
//                 height: 48.h,
//                 width: 327.w,
//                 radius: 12.r,
//                 imagePath: AppImages.googleIcon,
//                 bgColor: AppColors.whiteColor,
//                 borderColor: AppColors.greyColor1,
//                 textColor: AppColors.blackColor,
//                 text: 'Continue with Google',
//                 fontWeight: FontWeight.w600,
//                 fontSize: 14.sp,
//                 onclick: () {},
//                 isGradient: false,
//               ),

//               SizedBox(height: 20.h),
//               CustomButton(
//                 height: 48.h,
//                 width: 327.w,
//                 radius: 12.r,
//                 imagePath: AppImages.facebookIcon,
//                 bgColor: AppColors.whiteColor,
//                 borderColor: AppColors.greyColor1,
//                 textColor: AppColors.blackColor,
//                 text: 'Continue with Facebook',
//                 fontWeight: FontWeight.w600,
//                 fontSize: 14.sp,
//                 onclick: () {},
//                 isGradient: false,
//               ),
//               SizedBox(height: 25.h),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     'Don’t have an account?',
//                     style: GoogleFonts.inter(
//                       fontSize: 12.sp,
//                       fontWeight: FontWeight.w500,
//                       color: AppColors.greyColor,
//                     ),
//                   ),
//                   SizedBox(width: 4.w),
//                   Padding(
//                     padding: EdgeInsets.only(right: 30.0.w),
//                     child: InkWell(
//                       onTap: () {
//                         Get.to(SignUpScreen());
//                       },
//                       child: Text(
//                         'Sign Up',
//                         style: GoogleFonts.inter(
//                           fontSize: 12.sp,
//                           fontWeight: FontWeight.w600,
//                           color: AppColors.blackColor,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
