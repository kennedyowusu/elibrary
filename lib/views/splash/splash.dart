import 'package:elibrary/constants/colors.dart';
import 'package:elibrary/constants/images.dart';
import 'package:elibrary/controllers/auth/auth_manager.dart';
import 'package:elibrary/views/onboard/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashView extends StatelessWidget {
  final AuthenticationManager _authmanager = Get.put(AuthenticationManager());

  Future<void> initializeSettings() async {
    _authmanager.checkLoginStatus();

    //Simulate other services for 3 seconds
    await Future.delayed(Duration(seconds: 3));
  }

  @override
  Widget build(BuildContext context) {
    // getting the orientation of the app
    Orientation orientation = MediaQuery.of(context).orientation;

    //size of the window
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return FutureBuilder(
      future: initializeSettings(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return waitingView(height, width, orientation);
        } else {
          if (snapshot.hasError)
            return errorView(snapshot);
          else
            return OnBoard();
        }
      },
    );
  }

  Scaffold errorView(AsyncSnapshot<Object?> snapshot) {
    return Scaffold(
      body: Center(
        child: Text('Error: ${snapshot.error}'),
      ),
    );
  }

  waitingView(height, width, orientation) {
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
      )),
    );
  }
}
