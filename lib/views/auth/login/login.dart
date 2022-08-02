import 'package:elibrary/constants/colors.dart';
import 'package:elibrary/constants/styles.dart';
import 'package:elibrary/views/auth/login/components/login_form.dart';
import 'package:elibrary/widgets/auth_design.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: ProjectStyle.padding(context),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                authDesign(height, width),
                Center(
                  child: Hero(
                    tag: 'logo',
                    child: Image.asset(
                      'assets/image/library.png',
                      height: height * 0.2,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.040,
                ),
                Text(
                  'Welcome Back!',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  'Please login to continue',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: height * 0.02),
                LoginForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
