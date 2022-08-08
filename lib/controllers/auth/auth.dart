import 'dart:convert';
import 'dart:io';

import 'package:elibrary/model/user.dart';
import 'package:elibrary/services/auth/auth.dart';
import 'package:elibrary/services/endpoints/endpoints.dart';
import 'package:elibrary/utils/shared_prefs.dart';
import 'package:elibrary/views/auth/login/login.dart';
import 'package:elibrary/widgets/button_nav.dart';
import 'package:elibrary/widgets/error.dart';
import 'package:elibrary/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

class AuthController extends GetxController {
  AuthService authService = AuthService();
  ProjectApis projectApis = ProjectApis();

  String name = '';
  String email = '';
  String password = '';
  String confirmPassword = '';
  var isPasswordHidden = true.obs;

  Future createUserAccount(BuildContext context) async {
    showLoaderDialog(context, message: "signing up ...");

    http.Response response = await authService.signUpUser(
      name,
      email,
      password,
      confirmPassword,
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> responseData = json.decode(response.body);
      debugPrint(responseData.toString());

      User user = User.fromJson(responseData);

      UserPreferences().setUser(user);
      debugPrint("print this " + user.toString());
      Navigator.pop(context);
      Get.offAll(() => BottomNavigation());

      return;
    } else {
      Navigator.pop(context);

      showErrorDialog(context, message: response.body);
      return;
    }
  }

  Future loginUser(BuildContext context) async {
    showLoaderDialog(context, message: 'Logging in...');

    http.Response response = await authService.signInUser(
      email,
      password,
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> responseData = json.decode(response.body);

      debugPrint(responseData.toString());
      debugPrint(responseData['message']);

      User userData = User.fromJson(responseData);

      UserPreferences().setUser(userData);
      Navigator.pop(context);
      Get.offAll(() => BottomNavigation());
      return;
    } else {
      Navigator.pop(context);

      showErrorDialog(context, message: response.body.toString());
      return;
    }
  }

  Future signOut() async {
    await authService.signOutUser();
    Get.offAll(() => LoginScreen());
  }
}
