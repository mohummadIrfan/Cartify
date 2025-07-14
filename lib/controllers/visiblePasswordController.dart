import 'package:get/get.dart';

class PasswordVisibilityController extends GetxController {
  var isPasswordVisible = false.obs;
  var isConfirmPasswordVisible = false.obs;
  var isOldPassword = false.obs;
  var isnewPassword = false.obs;
  var isConfirmnewPassword = false.obs;

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;
  }

  void toggleoldPasswordVisibility() {
    isOldPassword.value = !isOldPassword.value;
  }

  void togglenewPasswordVisibility() {
    isnewPassword.value = !isnewPassword.value;
  }

  void toggleConfirmnewPasswordVisibility() {
    isConfirmnewPassword.value = !isConfirmnewPassword.value;
  }
}
