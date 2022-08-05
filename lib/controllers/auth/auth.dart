import 'dart:convert';

import 'package:elibrary/constants/colors.dart';
import 'package:elibrary/services/auth/auth.dart';
import 'package:elibrary/services/shared_prefs.dart';
import 'package:elibrary/views/auth/login/login.dart';
import 'package:elibrary/views/home/home.dart';
import 'package:elibrary/widgets/button_nav.dart';
import 'package:elibrary/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:http/http.dart' as http;

class AuthController extends GetxController {
  late BuildContext context;
  AuthService authService = AuthService();
  Persistent persistent = Persistent();

  String name = '';
  String phone = '';
  String email = '';
  String password = '';
  String confirmPassword = '';
  bool _isLoading = false;
  var isPasswordHidden = true.obs;

  Future createUserAccount() async {
    http.Response response = await authService.signUpUser(
      name,
      email,
      phone,
      password,
      confirmPassword,
    );
    Map<String, dynamic> responseData = json.decode(response.body);
    if (response.statusCode == 200) {
      await persistent.preferences.setString('token', responseData['token']);

      _isLoading == true
          ? showLoaderDialog(context, message: 'Loading...')
          : null;
      Get.offAll(() => HomeView());
    } else {
      Get.snackbar(
        "Error Occurred",
        responseData['error'],
      );
    }
  }

  Future signInUser() async {
    http.Response response = await authService.signInUser(
      email,
      password,
    );
    Map<String, dynamic> responseData = json.decode(response.body);
    if (response.statusCode == 200) {
      _isLoading == true
          ? showLoaderDialog(
              context,
            )
          : null;
      Get.offAll(() => BottomNavigation());
    } else {
      Get.snackbar(
        "Error Occurred",
        responseData['error'],
      );
    }
  }

  // sign in user and show loader when loading
  Future signInUserWithLoader() async {
    _isLoading = true;
    await signInUser();
    _isLoading = false;
  }

  // show loading indicator when loading is true
  // Widget loader() {
  //   if (_isLoading) {
  //     return Loader();
  //   } else {
  //     return Container();
  //   }
  // }

  Future signOut() async {
    await authService.signOutUser();
    Get.offAll(() => LoginScreen());
  }
}
