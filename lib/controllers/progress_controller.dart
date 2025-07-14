import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ProgressController extends GetxController {
  RxInt pageNo = 1.obs;
  var isCheckedList = <bool>[].obs;
  RxSet<int> selectedIndexes =
      <int>{0, 2, 5, 6}.obs; // 1st, 3rd, 6th, 7th (0-based index)
  RxList<ServiceItem> services = <ServiceItem>[ServiceItem()].obs;

  void addService() {
    services.add(ServiceItem());
  }

  void reset() {
    pageNo.value = 1;
    // Add any other state resets if necessary
  }

  void toggleSelect(int index) {
    if (selectedIndexes.contains(index)) {
      selectedIndexes.remove(index);
    } else {
      selectedIndexes.add(index);
    }
  }

  @override
  void onInit() {
    super.onInit();

    /// Set initial checkbox list based on the longest list among the questions
    int maxLength = [
      skillsList.length,
      userList.length,
    ].reduce((a, b) => a > b ? a : b);

    isCheckedList.assignAll(List.generate(maxLength, (_) => false));
  }

  void toggle(int index) {
    if (index >= 0 && index < isCheckedList.length) {
      isCheckedList[index] = !isCheckedList[index];
    }
  }

  RxDouble get indicatorBar {
    return (pageNo.value.clamp(1, 7) * 0.1).obs;
  }

  List<String> titleList = [
    'Profile Set Up',
    'Enter Your Skills',
    'Select User Type',
    'Showcase Your Skills',
    'Help Us Verify',
    'Successful Creation!',
  ];

  List<String> subtitleList = [
    'Enter details below',
    'Select up to 10 skills to personalize your \nexperience.',
    'How would you like to continue in night wacht?',
    'You can choose up to 3 services',
    'This info is used to maintain transparency.',
    'Congratulations! \nYou have created your profile successfully! Lets \nexplore the world of opportunities!',
  ];

  List<String> skillsList = [
    'User Interface',
    'User Experience',
    'User Research',
    'User Testing',
    'Service Design',
    'Strategy',
    'Design Systems',
    'User Testing',
    'Service Design',
    'Strategy',
    'Design Systems',
  ];

  List<String> userList = [
    'To get hired based on my skills',
    'Find skilled professionals',
  ];
}

class ServiceItem {
  RxnString selectedService = RxnString(null);
  TextEditingController chargeController = TextEditingController();
}
