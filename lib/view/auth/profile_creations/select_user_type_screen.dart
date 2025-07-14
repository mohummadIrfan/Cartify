import 'package:ecommerce_api_app/controllers/progress_controller.dart';
import 'package:ecommerce_api_app/utlis/colors.dart';
import 'package:ecommerce_api_app/view/auth/profile_creations/widgets/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SelectUserTypeScreen extends StatelessWidget {
  const SelectUserTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ProgressController controller =
        Get.isRegistered<ProgressController>()
            ? Get.find<ProgressController>()
            : Get.put(ProgressController());

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SingleChildScrollView(
        child: Column(
          children: List.generate(controller.userList.length, (index) {
            return Padding(
              padding: EdgeInsets.only(bottom: 10.h, top: 3.h),
              child: buildSelectableTile(
                title: controller.userList[index], // ✅ use individual item
                index: index,
              ),
            );
          }),
        ),
      ),
    );
  }
}
