import 'package:elibrary/controllers/auth/auth_manager.dart';
import 'package:elibrary/views/auth/login/login.dart';
import 'package:elibrary/views/home/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoard extends StatelessWidget {
  const OnBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthenticationManager _authManager = Get.find();

    return Obx(
      () {
        return _authManager.isLogged.value ? HomeView() : LoginScreen();
      },
    );
  }
}
