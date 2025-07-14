import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileImageController extends GetxController {
  Rx<File?> profileImage = Rx<File?>(null);
  final ImagePicker _picker = ImagePicker();

  Future<void> pickImage(ImageSource source) async {
    try {
      final XFile? pickedFile = await _picker.pickImage(source: source, imageQuality: 85);
      if (pickedFile != null) {
        profileImage.value = File(pickedFile.path);
      } else {
        print("User cancelled image picking");
      }
    } catch (e) {
      print("Image picking error: $e");
    }
  }
}
