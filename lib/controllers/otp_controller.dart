import 'dart:convert';

import 'package:ecommerce_api_app/model/userModel.dart';
import 'package:ecommerce_api_app/utlis/constant.dart';
import 'package:ecommerce_api_app/utlis/manage_http_request.dart';
import 'package:ecommerce_api_app/view/auth/login/reset_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class OtpController extends GetxController {
  final String email;

  OtpController(this.email);
  // 4 TextEditingControllers for OTP input
  final List<TextEditingController> pinPutControllers = List.generate(
    4,
    (_) => TextEditingController(),
  );

  // 4 FocusNodes for managing input focus
  final List<FocusNode> focusNodes = List.generate(4, (_) => FocusNode());

  /// Combine OTP digits into one string
  String getOTP() {
    return pinPutControllers.map((c) => c.text).join();
  }

  /// Simulate sending OTP (API call can go here)
  Future<void> sendOtp({required String email, required context}) async {
    UserModel user = UserModel(email: email);
    try {
      http.Response response = await http.post(
        Uri.parse('$baseUrl/api/forgot-password'),
        body: jsonEncode(user.toJson()),
        headers: {'Content-Type': 'application/json'},
      );
      manageHttpRequest(
        response: response,
        context: context,
        onSuccess: () {
          showSnackBar("Otp send", "msg send to this email successfully");
          // Get.to(OtpVerificationScreen(email: emailController.text.trim()));
        },
      );
    } catch (e) {
      showSnackBar("Error", e.toString());
    }
    // simulate OTP resend
    debugPrint("OTP resent");
  }

  /// Simulate verifying OTP
  void verifyOtp() async {
    String otp = getOTP();
    if (otp.length != 4) {
      Get.snackbar('Error', 'Please enter the 4-digit OTP.');
      return;
    }

    try {
      http.Response response = await http.post(
        Uri.parse('$baseUrl/api/verify-otp'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({"email": email, "otp": otp}),
      );

      manageHttpRequest(
        response: response,
        context: Get.context!,
        onSuccess: () {
          Get.snackbar('Success', 'OTP Verified');
          Get.to(() => ResetPasswordScreen(email: email));
        },
      );
    } catch (e) {
      showSnackBar("Error", e.toString());
    }
  }

  @override
  void onClose() {
    for (var controller in pinPutControllers) {
      controller.dispose();
    }
    for (var node in focusNodes) {
      node.dispose();
    }
    super.onClose();
  }
}
