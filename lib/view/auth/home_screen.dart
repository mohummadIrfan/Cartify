import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_api_app/controllers/api_contoller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BannerScreen extends StatefulWidget {
  const BannerScreen({super.key});

  @override
  State<BannerScreen> createState() => _BannerScreenState();
}

class _BannerScreenState extends State<BannerScreen> {
  final BannerController bannerController = Get.put(BannerController());

  @override
  void initState() {
    super.initState();
    if (bannerController.bannerList.isEmpty) {
      bannerController.fetchBanner(context);
    }
  }

  @override
@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('Banners'),
    ),
    body: Obx(() {
      if (bannerController.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      if (bannerController.bannerList.isEmpty) {
        return const Center(child: Text("No banners found"));
      }

      return CarouselSlider(
        options: CarouselOptions(
          height: 200,
          autoPlay: true,
          enlargeCenterPage: true,
          viewportFraction: 0.9,
        ),
        items: bannerController.bannerList.map((banner) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              banner.image ?? '',
              fit: BoxFit.cover,
              width: double.infinity,
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.broken_image),
            ),
          );
        }).toList(),
      );
    }),
  );
}

}
