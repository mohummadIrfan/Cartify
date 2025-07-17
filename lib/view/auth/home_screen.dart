import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_api_app/controllers/auth_controller.dart';
import 'package:ecommerce_api_app/controllers/banner_contoller.dart';
import 'package:ecommerce_api_app/controllers/product_controller.dart';
import 'package:ecommerce_api_app/utlis/colors.dart';
import 'package:ecommerce_api_app/view/widgets/custom_elevated_button.dart';
import 'package:ecommerce_api_app/view/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class BannerScreen extends StatefulWidget {
  const BannerScreen({super.key});

  @override
  State<BannerScreen> createState() => _BannerScreenState();
}

class _BannerScreenState extends State<BannerScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController idController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final BannerController bannerController = Get.put(BannerController());
  final AuthController authController = Get.put(AuthController());
  final ProductController productsController = Get.put(ProductController());
  @override
  void initState() {
    super.initState();
    if (bannerController.bannerList.isEmpty) {
      bannerController.fetchBanner(context);
    }
    if (bannerController.desList.isEmpty) {
      bannerController.fetchData(context);
    }
    if (productsController.productList.isEmpty) {
      productsController.fetchProducts(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        title: const Text('Banners'),

        actions: [
          InkWell(
            onTap: () {
              authController.logoutUser();
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('LogOut'),
            ),
          ),
        ],
      ),
      body: Obx(() {
        if (bannerController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ✅ Banner Carousel
                  SizedBox(height: 20.h),
                  if (bannerController.bannerList.isNotEmpty)
                    CarouselSlider(
                      options: CarouselOptions(
                        height: 200,
                        autoPlay: true,
                        enlargeCenterPage: true,
                        viewportFraction: 0.9,
                      ),
                      items:
                          bannerController.bannerList.map((banner) {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                banner.image ?? '',
                                fit: BoxFit.cover,
                                width: double.infinity,
                                errorBuilder:
                                    (context, error, stackTrace) =>
                                        const Icon(Icons.broken_image),
                              ),
                            );
                          }).toList(),
                    )
                  else
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("No banners found"),
                    ),

                  SizedBox(height: 10.h),

                  // ✅ Description ListView (shrink-wrapped inside scroll view)
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: productsController.productList.length,
                    // itemCount: bannerController.desList.length,
                    itemBuilder: (context, index) {
                      // final item = bannerController.desList[index];
                      final item = productsController.productList[index];
                      print("Item: ${item.id}, ${item.title}, ${item.image}");
                      return Padding(
                        padding: EdgeInsets.symmetric(
                          //   horizontal: 25.0.w,
                          vertical: 5.h,
                        ),
                        child: Container(
                          // margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.r),
                            color: AppColors.lightYellow,
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: 12.0.h,
                              left: 3.w,
                              right: 3.w,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 100.h,
                                  width: double.infinity,

                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.transparent,
                                  ),
                                  child: Image.network(
                                    item.image.toString(),
                                    fit: BoxFit.cover,
                                    errorBuilder:
                                        (context, error, stackTrace) =>
                                            const Icon(Icons.broken_image),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text(
                                    item.price.toString(),
                                    style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14.sp,
                                      color: AppColors.blackColor,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 7.h),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text(
                                    item.title.toString(),
                                    style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12.sp,
                                      color: AppColors.greyColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 12.h),

                  Text('ID', style: _labelStyle()),
                  SizedBox(height: 5.h),
                  CustomTextField(
                    height: 46.h,
                    controller: idController,
                    hintText: "id",
                    hintColor: AppColors.blackColor,
                    borderColor: AppColors.yellowColor,
                    fillColor: AppColors.whiteColor,
                    //prefixIcon: Image.asset(AppImages.emailIcon),
                    // AppImages.emailIcon,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'id is required';
                      }
                      return null;
                    },
                  ),

                  SizedBox(height: 10.h),

                  /// Email
                  Text('Title', style: _labelStyle()),
                  SizedBox(height: 5.h),
                  CustomTextField(
                    height: 46.h,
                    controller: titleController,
                    hintText: "title",
                    hintColor: AppColors.blackColor,
                    borderColor: AppColors.lightgreyColor,
                    fillColor: AppColors.whiteColor,
                    //  prefixIcon: Image.asset(AppImages.emailIcon),
                    // AppImages.emailIcon,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'title is required';
                      }

                      return null;
                    },
                  ),

                  SizedBox(height: 10.h),

                  /// Password
                  Text('Price', style: _labelStyle()),
                  SizedBox(height: 5.h),
                  CustomTextField(
                    height: 46.h,
                    controller: priceController,
                    hintText: "price",
                    hintColor: AppColors.blackColor,
                    borderColor: AppColors.lightgreyColor,
                    fillColor: AppColors.whiteColor,
                    //  prefixIcon: Image.asset(AppImages.emailIcon),
                    // AppImages.emailIcon,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'title is required';
                      }

                      return null;
                    },
                  ),

                  SizedBox(height: 10.h),

                  CustomTextField(
                    height: 46.h,
                    controller: descriptionController,
                    hintText: "description",
                    hintColor: AppColors.blackColor,
                    borderColor: AppColors.lightgreyColor,
                    fillColor: AppColors.whiteColor,
                    //  prefixIcon: Image.asset(AppImages.emailIcon),
                    // AppImages.emailIcon,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'description is required';
                      }

                      return null;
                    },
                  ),
                  SizedBox(height: 25.h),

                  /// Sign Up Button
                  CustomButton(
                    height: 48.h,
                    width: 327.w,
                    radius: 10.r,
                    bgColor: AppColors.yellowColor,
                    textColor: AppColors.blackColor,
                    text: 'Post Products',
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp,
                    onclick: () async {
                      if (_formKey.currentState!.validate()) {
                        await productsController.postProducts(
                          id: int.tryParse(idController.text) ?? 0,

                          title: titleController.text,
                          description: descriptionController.text,
                          price: double.tryParse(priceController.text) ?? 0.0,

                          context: context,
                        );
                      }
                    },
                    isGradient: false,
                  ),

                  SizedBox(height: 35.h),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  TextStyle _labelStyle() => GoogleFonts.inter(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.blackColor,
  );
}
