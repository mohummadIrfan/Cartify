import 'dart:async';

import 'package:get/get.dart';

class TimerController extends GetxController {
  static TimerController create() {
    return Get.isRegistered<TimerController>()
        ? Get.find<TimerController>()
        : Get.put(TimerController());
  }

  RxInt secondRemaining = 60.obs;
  RxBool enableResend = false.obs;
  late Timer timer;

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (_) {
      if (secondRemaining.value != 0) {
        secondRemaining--;
      } else {
        enableResend.value = true;
        timer.cancel();
      }
    });
  }

  @override
  void onInit() {
    super.onInit();
    startTimer();
  }

  @override
  void onClose() {
    super.onClose();
    timer.cancel();
  }
}
