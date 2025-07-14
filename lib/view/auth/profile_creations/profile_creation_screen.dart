import 'package:ecommerce_api_app/controllers/progress_controller.dart';
import 'package:ecommerce_api_app/utlis/colors.dart' show AppColors;
import 'package:ecommerce_api_app/utlis/images.dart';
import 'package:ecommerce_api_app/view/auth/profile_creations/profile_setup_screen.dart';
import 'package:ecommerce_api_app/view/auth/profile_creations/select_skills_screen.dart';
import 'package:ecommerce_api_app/view/auth/profile_creations/select_user_type_screen.dart';
import 'package:ecommerce_api_app/view/auth/profile_creations/show_case_screen.dart';
import 'package:ecommerce_api_app/view/auth/profile_creations/sucessfullCreation_screen.dart';
import 'package:ecommerce_api_app/view/auth/profile_creations/upload_professionals_certificate_screen.dart';
import 'package:ecommerce_api_app/view/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileCreationScreen extends StatefulWidget {
  const ProfileCreationScreen({super.key});

  @override
  State<ProfileCreationScreen> createState() => _ProfileCreationScreen();
}

class _ProfileCreationScreen extends State<ProfileCreationScreen> {
  final ProgressController controller =
      Get.isRegistered<ProgressController>()
          ? Get.find<ProgressController>()
          : Get.put(ProgressController());

  late PageController _pageViewController;

  @override
  void initState() {
    super.initState();
    controller.reset(); // Reset all values inside controller
    _pageViewController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 79.h),
            Row(
              children: [
                SizedBox(
                  width: 322.w,
                  child: Obx(
                    () => Stack(
                      children: [
                        // Back Button
                        InkWell(
                          onTap: () {
                            if (controller.pageNo.value > 0) {
                              controller.pageNo.value--;
                              _pageViewController.previousPage(
                                duration: Duration(milliseconds: 500),
                                curve: Curves.easeOut,
                              );
                            } else {
                              Get.back();
                            }
                          },
                          child: Image.asset(
                            AppImages.leftarrow,
                            height: 24.h,
                            width: 24,
                          ),
                        ),

                        // Progress Indicator Bar
                        Padding(
                          padding: EdgeInsets.only(left: 28.0.w, top: 10.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: List.generate(6, (index) {
                              bool isFilled = index < controller.pageNo.value;
                              return Container(
                                margin: EdgeInsets.symmetric(horizontal: 4.w),
                                height: 6.h,
                                width: 41.w,
                                decoration: BoxDecoration(
                                  color:
                                      isFilled
                                          ? AppColors.blackColor
                                          : AppColors.lightgreyColor,
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                              );
                            }),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 7.w),
              ],
            ),
            SizedBox(height: 34.h),

            /// Title
            Obx(
              () => Text(
                controller.titleList[(controller.pageNo.value - 1).clamp(
                  0,
                  controller.titleList.length - 1,
                )],
                style: GoogleFonts.inter(
                  fontSize: 32.sp,
                  color: AppColors.blackColor,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            SizedBox(height: 14.h),

            /// Subtitle
            Obx(
              () => Text(
                controller.subtitleList[(controller.pageNo.value - 1).clamp(
                  0,
                  controller.subtitleList.length - 1,
                )],
                style: GoogleFonts.inter(
                  fontSize: 14.sp,
                  color: AppColors.blackColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(height: 10.h),

            /// PageView for Step Screens
            Expanded(
              child: PageView(
                controller: _pageViewController,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  ProfileSetupScreen(),
                  SelectSkillsScreen(),
                  SelectUserTypeScreen(),
                  ShowCaseScreen(),
                  UploadCertificateScreen(),
                  SucessfullcreationScreen(),
                ],
              ),
            ),
            SizedBox(height: 10.h),

            /// Button
            Obx(
              () => Padding(
                padding: EdgeInsets.only(bottom: 10.0.h, left: 5.w),
                child: CustomButton(
                  bgColor: AppColors.yellowColor,
                  height: 48.h,
                  width: 330.w,
                  radius: 12.r,
                  text: controller.pageNo.value != 6 ? 'Next' : 'Let’s Start',
                  textColor: AppColors.blackColor,
                  onclick: () {
                    if (controller.pageNo.value < 6) {
                      controller.pageNo.value++;
                      _pageViewController.nextPage(
                        duration: Duration(milliseconds: 600),
                        curve: Curves.easeIn,
                      );
                    } else {
                      //  Get.offAll(() => BottomNavScreen());
                    }
                  },
                  isGradient: false,
                ),
              ),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
