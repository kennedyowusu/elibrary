import 'package:elibrary/utils/shared_prefs.dart';
import 'package:elibrary/views/auth/login/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overboard/flutter_overboard.dart';
import 'package:get/get.dart';
import 'package:elibrary/views/onboard/components/slide.dart';

class OnboardView extends StatefulWidget {
  const OnboardView({Key? key}) : super(key: key);

  @override
  State<OnboardView> createState() => _OnboardViewState();
}

class _OnboardViewState extends State<OnboardView> {
  @override
  void initState() {
    UserPreferences().setSeenOnboard();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: OverBoard(
          allowScroll: true,
          pages: screen,
          showBullets: true,
          inactiveBulletColor: Colors.blue,
          skipCallback: () {
            Get.off(() => LoginScreen());
          },
          finishCallback: () {
            Get.off(() => LoginScreen());
          },
        ),
      ),
    );
  }
}
