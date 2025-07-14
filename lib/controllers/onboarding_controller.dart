import 'package:ecommerce_api_app/utlis/images.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  RxInt currentPage = 0.obs;
  final List<Map<String, String>> onBoardingData = [
    {
      'image': AppImages.onBoarding1,
      'sideImage': AppImages.onBoardRight1,
      'title': 'Welcome to \nNachtwacht',
      'subtitle':
          'Join a thriving network where educational \ninstitutions and skilled professionals \ncollaborate on meaningful projects.',
    },
    {
      'image': AppImages.onBoarding2,
      'sideImage': AppImages.onBoardRight2,
      'title': 'For Schools and \nInstitutions',
      'subtitle':
          'Post jobs, hire qualified educators, and \nmanage short-term or long-term \nassignments — all in one place.',
    },
    {
      'image': AppImages.onBoarding3,
      'sideImage': AppImages.onBoardRight3,
      'title': 'Unlock \nOpportunities',
      'subtitle':
          'Showcase your skills, build a trusted \nreputation, and get hired for impactful \nroles in education.',
    },
  ];
}
