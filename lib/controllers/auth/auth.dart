import 'dart:convert';

import 'package:elibrary/constants/colors.dart';
import 'package:elibrary/services/auth/auth.dart';
import 'package:elibrary/views/auth/login/login.dart';
import 'package:elibrary/views/home/home.dart';
import 'package:elibrary/widgets/button_nav.dart';
import 'package:elibrary/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;

class AuthController extends GetxController {
  late BuildContext context;
  AuthService authService = AuthService();

  String name = '';
  String phone = '';
  String email = '';
  String password = '';
  String confirmPassword = '';
  bool _isLoading = false;

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
          ? showLoaderDialog(context, message: 'Loading...')
          : null;
      Get.offAll(() => BottomNavigation());
    } else {
      Get.snackbar(
        "Error Occurred",
        responseData['error'],
      );
    }
  }

  Future signOut() async {
    await authService.signOutUser();
    Get.offAll(() => LoginScreen());
  }
}
