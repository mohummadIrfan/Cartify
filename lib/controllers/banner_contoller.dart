import 'dart:convert';

import 'package:ecommerce_api_app/model/banner_model.dart';
import 'package:ecommerce_api_app/utlis/constant.dart';
import 'package:ecommerce_api_app/utlis/manage_http_request.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class BannerController extends GetxController {
  RxList<BannerModel> bannerList = <BannerModel>[].obs;
  var isLoading = false.obs;

  Future<void> fetchBanner(BuildContext context) async {
    try {
      isLoading.value = true;

      final response = await http.get(Uri.parse('$baseUrl/api/banner'));
      print('response of banner is : ${response.body}');

      manageHttpRequest(
        response: response,
        context: context,
        onSuccess: () {
          final data = jsonDecode(response.body);

          if (data is List) {
            bannerList.value =
                data.map((e) => BannerModel.fromJson(e)).toList();
          } else if (data is Map<String, dynamic>) {
            bannerList.value = [BannerModel.fromJson(data)];
          }
        },
      );
    } catch (e) {
      print("Error fetching banners: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
