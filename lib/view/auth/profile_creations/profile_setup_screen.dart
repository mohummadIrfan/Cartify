import 'package:ecommerce_api_app/controllers/profile_controller.dart';
import 'package:ecommerce_api_app/utlis/colors.dart';
import 'package:ecommerce_api_app/utlis/images.dart';
import 'package:ecommerce_api_app/view/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class ProfileSetupScreen extends StatelessWidget {
  ProfileSetupScreen({super.key});

  final TextEditingController bioController = TextEditingController();
  final ProfileImageController imageController = Get.put(
    ProfileImageController(),
  );

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>(); // ✅ Form key

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Form(
          // ✅ Wrap with Form
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: 280.h,
                      width: 280.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(AppImages.decoLines),
                          fit: BoxFit.contain,
                        ),
                      ),
                      child: Obx(() {
                        return Center(
                          child: CircleAvatar(
                            radius: 93.r,
                            backgroundImage:
                                imageController.profileImage.value != null
                                    ? FileImage(
                                      imageController.profileImage.value!,
                                    )
                                    : AssetImage(AppImages.profileimage)
                                        as ImageProvider,
                          ),
                        );
                      }),
                    ),
                    Positioned(
                      bottom: 25.h,
                      child: InkWell(
                        onTap: () {
                          Get.bottomSheet(
                            Container(
                              padding: EdgeInsets.all(16.w),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20.r),
                                ),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ListTile(
                                    leading: Icon(Icons.camera_alt),
                                    title: Text("Take Photo"),
                                    onTap: () {
                                      imageController.pickImage(
                                        ImageSource.camera,
                                      );
                                      Get.back();
                                    },
                                  ),
                                  ListTile(
                                    leading: Icon(Icons.image),
                                    title: Text("Choose from Gallery"),
                                    onTap: () {
                                      imageController.pickImage(
                                        ImageSource.gallery,
                                      );
                                      Get.back();
                                    },
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        child: Container(
                          height: 46.h,
                          width: 46.w,
                          decoration: BoxDecoration(
                            color: AppColors.whiteColor,
                            borderRadius: BorderRadius.circular(14.r),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xFF8B9EB8).withOpacity(0.2),
                                blurRadius: 4,
                                offset: Offset(0, 1),
                              ),
                            ],
                          ),
                          child: Center(
                            child: Image.asset(
                              AppImages.album,
                              height: 14.h,
                              width: 14.w,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),

              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'What’s your Beschrijving / Bio?',
                  style: GoogleFonts.inter(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.blackColor,
                  ),
                ),
              ),
              SizedBox(height: 20.h),

              CustomTextField(
                height: 46.h,
                controller: bioController,
                hintText: "Enter Bio",
                obscureText: false,
                hintColor: AppColors.greyColor,
                borderColor: AppColors.lightgreyColor,
                fillColor: AppColors.whiteColor,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Bio is required';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
