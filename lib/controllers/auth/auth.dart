import 'dart:convert';
import 'dart:io';

import 'package:elibrary/model/user.dart';
import 'package:elibrary/services/auth/auth.dart';
import 'package:elibrary/services/endpoints/endpoints.dart';
import 'package:elibrary/utils/shared_prefs.dart';
import 'package:elibrary/views/auth/login/login.dart';
import 'package:elibrary/views/home/home.dart';
import 'package:elibrary/widgets/button_nav.dart';
import 'package:elibrary/widgets/error.dart';
import 'package:elibrary/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

class AuthController extends GetxController {
  late BuildContext context;
  AuthService authService = AuthService();
  ProjectApis projectApis = ProjectApis();

  String name = '';
  String phone = '';
  String email = '';
  String password = '';
  String confirmPassword = '';
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
      Get.offAll(
        () => HomeView(),
      );
    } else {
      Get.snackbar(
        "Error Occurred",
        responseData['error'],
      );
    }
  }

  Future loginUserNew() async {
    showLoaderDialog(context, message: 'Logging in...');

    http.Response response = await authService.signInUser(
      email,
      password,
    );
    if (response.statusCode == 200 || response.body != '') {
      Map<String, dynamic> responseData = json.decode(response.body);
      debugPrint(responseData.toString());
      if (responseData['status'] == 'success') {
        var userData = User.fromJson(responseData['data']);
        debugPrint("login: token=${userData.token}");
        Directory documentDirectory = await getApplicationDocumentsDirectory();
        userData.applicationDirPath = documentDirectory.path;
        UserPreferences().setUser(userData);
        Navigator.pop(context);
        Get.offAll(() => BottomNavigation());
        return;
      } else {
        Navigator.pop(context);
        showErrorDialog(context, message: responseData['message']);
        return;
      }
    } else {
      Navigator.pop(context);
      Map<String, dynamic> responseData = json.decode(response.body);
      showErrorDialog(context,
          message: responseData['message'] ?? 'Server Error');
      return;
    }
  }

  Future signOut() async {
    await authService.signOutUser();
    Get.offAll(() => LoginScreen());
  }
}
