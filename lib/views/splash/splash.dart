import 'package:elibrary/constants/colors.dart';
import 'package:elibrary/constants/images.dart';
import 'package:elibrary/controllers/auth/auth.dart';
import 'package:elibrary/model/api_response.dart';
import 'package:elibrary/services/endpoints/endpoints.dart';
import 'package:elibrary/views/auth/login/login.dart';
import 'package:elibrary/widgets/button_nav.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashView extends StatefulWidget {
  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  ProjectApis projectApis = ProjectApis();
  AuthController authController = AuthController();

  void loadUserData() async {
    String token = await AuthController().getUserToken();

    if (token == "") {
      Get.offAll(() => LoginScreen());
    } else {
      ApiResponse response = await authController.getUserData();

      if (response.message == "success") {
        Get.offAll(() => BottomNavigation());
      } else if (response.message == projectApis.errorMessageUnauthorized) {
        Get.offAll(() => LoginScreen());
      } else {
        Get.snackbar(
          "",
          "Something went wrong",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    }
  }

  @override
  void initState() {
    loadUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: height * 0.1,
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage(ProjectImages.logo),
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: CircularProgressIndicator(
                  color: ProjectColors.primary,
                ),
              ),
              Text(
                'Knowledge is Power.',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
