import 'package:elibrary/views/onboard/onboarding.dart';
import 'package:elibrary/widgets/button_nav.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashController extends GetxController {
  // final getStorage = GetStorage();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();

    // if (getStorage.read("token") != null) {
    //   Future.delayed(Duration(milliseconds: 500), () {
    //     Get.offAll(() => BottomNavigation());
    //   });
    // } else {
    //   Get.off(() => OnboardingScreen());
    // }
  }
}
