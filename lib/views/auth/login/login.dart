import 'package:elibrary/constants/styles.dart';
import 'package:elibrary/views/auth/login/components/login_form.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: ProjectStyle.padding(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome Back!',
                style: TextStyle(fontSize: 20),
              ),
              Text(
                'Please login to continue',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: height * 0.08),
              LoginForm(),
            ],
          ),
        ),
      ),
    );
  }
}
