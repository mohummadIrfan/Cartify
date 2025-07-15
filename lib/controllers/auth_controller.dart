import 'dart:convert';

import 'package:ecommerce_api_app/model/userModel.dart';
import 'package:ecommerce_api_app/utlis/constant.dart';
import 'package:ecommerce_api_app/utlis/manage_http_request.dart';
import 'package:ecommerce_api_app/view/auth/home_screen.dart';
import 'package:ecommerce_api_app/view/auth/login/back_to_login_screen.dart';
import 'package:ecommerce_api_app/view/auth/login/otp_verified_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AuthController extends GetxController {
  var isLoading = false.obs;
  final TextEditingController emailController = TextEditingController();
  Future<void> SignupUser({
    required String email,
    required context,
    required String fullname,
    required String password,
  }) async {
    isLoading.value = true;
    try {
      UserModel user = UserModel(
        email: email,
        fullName: fullname,
        password: password,
      );

      http.Response response = await http.post(
        Uri.parse('$baseUrl/api/signup'),
        body: jsonEncode(user.toJson()),
        headers: {'Content-Type': 'application/json'},
      );

      print("Signup Response: ${response.body}");
      manageHttpRequest(
        response: response,
        context: context,
        onSuccess: () {
          showSnackBar('AccountCreate', 'Account Create Successfully');
        },
      );
    } catch (e) {
      showSnackBar('error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> SigninUser({
    required context,
    required String email,
    required String password,
  }) async {
    UserModel user = UserModel(email: email, password: password);
    try {
      http.Response response = await http.post(
        Uri.parse('$baseUrl/api/signin'),
        body: jsonEncode(user.toJson()),
        headers: {'Content-Type': 'application/json'},
      );

      print("Signin Response: ${response.body}");
      manageHttpRequest(
        response: response,
        context: context,
        onSuccess: () {
          showSnackBar('Login', 'Login Account Successfully');
          Get.to(BannerScreen());
        },
      );
    } catch (e) {
      showSnackBar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> forgetPassword({required String email, required context}) async {
    isLoading.value = true;
    UserModel user = UserModel(email: email);
    try {
      http.Response response = await http.post(
        Uri.parse('$baseUrl/api/forgot-password'),
        body: jsonEncode(user.toJson()),
        headers: {'Content-Type': 'application/json'},
      );

      print("Forget Password Response: ${response.body}");
      manageHttpRequest(
        response: response,
        context: context,
        onSuccess: () {
          showSnackBar("Otp send", "msg send to this email successfully");
          Get.to(OtpVerificationScreen(email: emailController.text.trim()));
        },
      );
    } catch (e) {
      showSnackBar("Error", e.toString());
    }
  }

  Future<void> resetPassword({
    required context,
    required String email,
    required String newPassword,
    required String confirmNewPassword,
  }) async {
    try {
      http.Response response = await http.post(
        Uri.parse('$baseUrl/api/reset-password'),
        body: jsonEncode({
          "email": email,
          "newPassword": newPassword,
          "confirmPassword":
              confirmNewPassword, // ✅ Not confirmNewPassword as key
        }),

        headers: {'Content-Type': 'application/json'},
      );
      print("Reset Password Response: ${response.body}");
      manageHttpRequest(
        response: response,
        context: context,
        onSuccess: () {
          showSnackBar('Reset Password', 'Reset password sucessfully');
          Get.to(() => BackToLoginScreen());
        },
      );
    } catch (e) {
      showSnackBar('Error', e.toString());
    }
  }

  Future<void> signUpUser({
    required context,
    required String fullName,
    required String email,
    required String password,
  }) async {
    try {
      UserModel user = UserModel(
        email: email,
        fullName: fullName,
        password: password,
      );
      http.Response response = await http.post(
        Uri.parse("$baseUrl/api/sigup"),
        body: jsonEncode(user.toJson()),
        headers: {'Content-Type': 'application/json'},
      );

      print('sigUp Response ${response.body}');

      manageHttpRequest(
        response: response,
        context: context,
        onSuccess: () {
          showSnackBar("Login", "Login Sucessfully");
        },
      );
    } catch (e) {}
  }
}
