import 'package:elibrary/services/shared_prefs.dart';
import 'package:elibrary/views/auth/login/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'views/crud/post/post.dart';

int? initScreen;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Persistent persistent = Persistent();

  initScreen = await persistent.getInt('initScreen');
  await persistent.setInt('initScreen', 1);

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
      initialRoute: initScreen == 0 || initScreen == null ? "login" : "/",
      routes: {
        '/': (context) => BorrowBook(),
        "login": (context) => BorrowBook(),
      },
    );
  }
}
