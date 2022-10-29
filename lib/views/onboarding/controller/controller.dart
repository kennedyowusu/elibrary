import 'package:elibrary/constants/images.dart';
import 'package:elibrary/views/auth/login/login.dart';
import 'package:elibrary/views/onboarding/components/onboarding_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  var selectedPageIndex = 0.obs;
  bool get isLastPage => selectedPageIndex.value == onboardingPages.length - 1;
  var pageController = PageController();

  forwardAction() {
    if (isLastPage) {
      Get.to(
        () => LoginView(),
        transition: Transition.rightToLeft,
      );
    } else {
      pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
    }
  }

  List<OnboardingInfo> onboardingPages = [
    OnboardingInfo(
      imageAsset: ProjectImages.library,
      title: 'Road to Knowledge',
      description: 'Nothing is pleasanter than exploring a library',
    ),
    OnboardingInfo(
      imageAsset: ProjectImages.library_2,
      title: 'Sharing Knowledge',
      description:
          'I have always imagined that Paradise will be a kind of a Library',
    ),
    OnboardingInfo(
      imageAsset: ProjectImages.library_3,
      title: 'Reading Time',
      description: 'When in doubt go to the library',
    ),
  ];
}
