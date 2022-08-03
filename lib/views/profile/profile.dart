import 'package:elibrary/services/shared_prefs.dart';
import 'package:elibrary/views/auth/login/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final Persistent persistent = Persistent();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text('Profile Screen'),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              persistent.removeUserData('token');
              Get.offAll(() => LoginScreen());
            },
            child: Text("Logout"),
          )
        ],
      ),
    );
  }
}
