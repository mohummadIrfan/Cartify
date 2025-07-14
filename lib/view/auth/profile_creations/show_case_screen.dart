import 'package:ecommerce_api_app/controllers/progress_controller.dart';
import 'package:ecommerce_api_app/utlis/colors.dart';
import 'package:ecommerce_api_app/view/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ShowCaseScreen extends StatelessWidget {
  final ProgressController controller =
      Get.isRegistered<ProgressController>()
          ? Get.find<ProgressController>()
          : Get.put(ProgressController());
  // final DropdownController controllers = Get.put(DropdownController());
  final List<String> serviceOptions = [
    'Plumbing',
    'Electrical',
    'Cleaning',
    'Gardening',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Obx(() {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...controller.services.asMap().entries.map((entry) {
                int index = entry.key;
                ServiceItem item = entry.value;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20.h),
                    Text(
                      index == 0
                          ? "Service Category"
                          : "Service $index Category",
                      style: GoogleFonts.inter(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.blackColor,
                      ),
                    ),
                    SizedBox(height: 5.h),
                    // Obx(
                    //   () => DropdownField(
                    //     options: controllers.options,
                    //     selected: controllers.dropdown1.value,
                    //     onChanged: controllers.updateDropdown1,
                    //     hint: 'Select job type',
                    //   ),
                    // ),
                    SizedBox(height: 10.h),
                    Text(
                      index == 0 ? "Service Charges" : "Service $index Charges",
                      style: GoogleFonts.inter(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.blackColor,
                      ),
                    ),
                    SizedBox(height: 5.h),
                    CustomTextField(
                      height: 46.h,
                      controller: item.chargeController,
                      hintText: "e.g. \$ per hour",
                      hintColor: AppColors.blackColor,
                      borderColor: AppColors.lightgreyColor,
                      fillColor: AppColors.whiteColor,
                      onChanged: (value) {
                        print("Charge changed: $value");
                      },
                    ),
                    // SizedBox(height: 5.h),
                  ],
                );
              }).toList(),
              GestureDetector(
                onTap: () => controller.addService(),
                child: Text(
                  "+ Add More",
                  style: GoogleFonts.inter(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.blackColor,
                  ),
                ),
              ),
              SizedBox(height: 10.h),
            ],
          ),
        );
      }),
    );
  }
}
