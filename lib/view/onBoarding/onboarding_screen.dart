import 'package:ecommerce_api_app/controllers/onboarding_controller.dart';
import 'package:ecommerce_api_app/utlis/colors.dart';
import 'package:ecommerce_api_app/utlis/images.dart';
import 'package:ecommerce_api_app/view/onBoarding/get_started_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final OnboardingController onBoardingController = Get.put(
    OnboardingController(),
  );
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      // Set background color based on current page
      Color backgroundColor;
      switch (onBoardingController.currentPage.value) {
        case 0:
          backgroundColor = AppColors.whiteColor;
          break;
        case 1:
          backgroundColor = AppColors.yellowColor;
          break;
        case 2:
          backgroundColor = AppColors.blackColor;
          break;
        default:
          backgroundColor = AppColors.blackColor;
      }

      // Circle button color
      Color circleColor;
      switch (onBoardingController.currentPage.value) {
        case 0:
          circleColor = AppColors.whiteColor;
          break;
        case 1:
          circleColor = AppColors.yellowColor;
          break;
        case 2:
          circleColor = AppColors.blackColor;
          break;
        default:
          circleColor = AppColors.greyColor;
      }

      return Scaffold(
        backgroundColor: backgroundColor,
        body: SizedBox.expand(
          child: Stack(
            children: [
              // Right-side image
              Positioned(
                right: 0,
                top: 0,
                bottom: 0,
                width: 83.w,
                child: Obx(() {
                  final sideImage =
                      onBoardingController.onBoardingData[onBoardingController
                          .currentPage
                          .value]['sideImage'] ??
                      '';
                  return Image.asset(sideImage, fit: BoxFit.cover);
                }),
              ),

              // Main content
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 25.w),
                child: Column(
                  children: [
                    // Skip button
                    SizedBox(
                      height: 60.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          onBoardingController.currentPage.value !=
                                  onBoardingController.onBoardingData.length - 1
                              ? InkWell(
                                onTap: () {
                                  Get.offAll(() => const GetStartedScreen());
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(right: 10.0.w),
                                  child: Text(
                                    'Skip',
                                    style: GoogleFonts.lato(
                                      color: AppColors.blackColor,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              )
                              : const SizedBox.shrink(),
                        ],
                      ),
                    ),

                    // Page content
                    Expanded(
                      child: PageView.builder(
                        controller: pageController,
                        itemCount: onBoardingController.onBoardingData.length,
                        onPageChanged: (index) {
                          onBoardingController.currentPage.value = index;
                        },
                        itemBuilder: (context, index) {
                          final data =
                              onBoardingController.onBoardingData[index];
                          return Column(
                            children: [
                              SizedBox(height: 80.h),
                              Image.asset(data['image']!, height: 285.h),
                              SizedBox(height: 140.h),
                              Padding(
                                padding: EdgeInsets.only(right: 88.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      data['title']!,
                                      style: GoogleFonts.inter(
                                        color:
                                            index == 2
                                                ? Colors.white
                                                : AppColors.blackColor,
                                        fontSize: 28.sp,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                    SizedBox(height: 20.h),
                                    Text(
                                      data['subtitle']!,
                                      style: GoogleFonts.inter(
                                        color:
                                            index == 2
                                                ? Colors.white
                                                : AppColors.blackColor,
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),

                    // Page indicator
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: 50.0.h,
                        //left: 5.w
                      ),
                      child: Obx(() {
                        final isBlack =
                            onBoardingController.currentPage.value == 2;
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: List.generate(
                            onBoardingController.onBoardingData.length,
                            (index) {
                              final isCurrent =
                                  onBoardingController.currentPage.value ==
                                  index;

                              final Color fillColor =
                                  isCurrent
                                      ? (isBlack
                                          ? AppColors.whiteColor
                                          : AppColors.blackColor)
                                      : Colors.transparent;

                              final Color borderColor =
                                  isBlack
                                      ? AppColors.whiteColor
                                      : AppColors.blackColor;

                              return AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                margin: EdgeInsets.symmetric(horizontal: 4.0.w),
                                height: 7.62.h,
                                width: 7.62.w,
                                decoration: BoxDecoration(
                                  color: fillColor,
                                  border: Border.all(
                                    color: borderColor,
                                    width: 0.76.w,
                                  ),
                                  borderRadius: BorderRadius.circular(2.29),
                                ),
                              );
                            },
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),

              // ✅ Tappable Circle Button (must be at top of stack)
              Positioned(
                right: 25.w,
                top: 477.13.h,
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(100),
                    onTap: () {
                      print("Circle tapped");
                      if (onBoardingController.currentPage.value <
                          onBoardingController.onBoardingData.length - 1) {
                        pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      } else {
                        Get.offAll(() => const GetStartedScreen());
                      }
                    },
                    child: Container(
                      height: 45.78.h,
                      width: 45.74.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: circleColor,
                      ),
                      child: Center(
                        child: Image.asset(
                          onBoardingController.currentPage.value == 2
                              ? AppImages
                                  .leftwarrow // <-- replace with actual image for index 3
                              : AppImages.iconLeft,
                          height: 9.336.h,
                          width: 8.w,
                          color:
                              onBoardingController.currentPage.value == 3
                                  ? null
                                  : null,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      );
    });
  }
}
