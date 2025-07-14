import 'package:ecommerce_api_app/utlis/colors.dart';
import 'package:ecommerce_api_app/view/auth/profile_creations/widgets/upload_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class UploadCertificateScreen extends StatelessWidget {
  const UploadCertificateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40.h),

            Text(
              'Upload Professional Certificate',
              style: GoogleFonts.inter(
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.blackColor,
              ),
            ),
            SizedBox(height: 10.h),

            Text(
              'Add your certificate here that verifies the skill \nservice you are offering.',
              style: GoogleFonts.inter(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.blackColor,
              ),
            ),
            SizedBox(height: 30.h),
            UploadBox(),

            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
