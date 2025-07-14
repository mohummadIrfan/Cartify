import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http show Response;

void manageHttpRequest({
  required http.Response response,
  required BuildContext context,
  required VoidCallback onSuccess,
}) {
  switch (response.statusCode) {
    case 200:
      onSuccess();
    case 400:
      showSnackBar('title', json.decode(response.body)['msg']);
    case 500:
      showSnackBar('Error', json.decode(response.body)['error']);
    case 201:
      onSuccess();
  }
}

void showSnackBar(String title, String message) {
  Get.snackbar(
    title,
    message,
    snackPosition: SnackPosition.TOP,
    backgroundColor: Get.theme.snackBarTheme.backgroundColor ?? null,
    colorText: Get.theme.snackBarTheme.contentTextStyle?.color ?? null,
  );
}
