import 'package:elibrary/views/crud/post/post.dart';
import 'package:elibrary/views/home/home.dart';
import 'package:elibrary/views/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'widgets/button_nav.dart';

void main() async {
  await GetStorage.init();
  runApp(Elibrary());
}

class Elibrary extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-Library',
      defaultTransition: Transition.rightToLeft,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      // home: SplashView(),
      home: BorrowBook(),
    );
  }
}
