import 'dart:convert';

import 'package:ecommerce_api_app/model/products_model.dart';
import 'package:ecommerce_api_app/utlis/constant.dart';
import 'package:ecommerce_api_app/utlis/manage_http_request.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ProductController extends GetxController {
  RxList<Products> productList = <Products>[].obs;
  var isLoading = false.obs;
  Future<void> fetchProducts(BuildContext context) async {
    try {
      isLoading.value = true;

      http.Response response = await http.get(
        Uri.parse('$baseProductUrl/products'),
      );

      print('Products api response is ${response.body}');

      manageHttpRequest(
        response: response,
        context: context,
        onSuccess: () {
          final data = jsonDecode(response.body);

          if (data is List) {
            productList.value = data.map((e) => Products.fromjson(e)).toList();
            print("Loaded products: ${productList.length}");
          } else if (data is Map<String, dynamic>) {
            productList.value = [Products.fromjson(data)];
          }
        },
      );
    } catch (e) {
      print("Fetch Products Error: $e");
    } finally {
      isLoading.value = false; // ✅ Ensure loading spinner stops
    }
  }

  Future<void> postProducts({
    required int id,
    required String title,
    required String description,
    required double price,
    required context,
  }) async {
    Products products = Products(
      id: id,
      title: title,
      description: description,
      price: price,
    );
    try {
      isLoading.value = true;

      http.Response response = await http.post(
        Uri.parse('$baseProductUrl/products'),

        body: jsonEncode(products.tojson()),
        headers: {'Content-Type': 'application/json'},
      );
      print('products posted is ${response.body}');
      manageHttpRequest(
        response: response,
        context: context,
        onSuccess: () {
          showSnackBar('ItemPost', 'Products post Successfully');
        },
      );
    } catch (e) {
      showSnackBar('error', 'error is $e');
    } finally {
      isLoading.value = false;
    }
  }
}
