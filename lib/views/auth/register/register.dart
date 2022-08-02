import 'package:elibrary/constants/colors.dart';
import 'package:elibrary/views/auth/register/component/register_form.dart';
import 'package:elibrary/widgets/auth_design.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: height * 0.02),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                authDesign(height, width),
                SizedBox(
                  height: height * 0.06,
                ),
                Text(
                  'Create Account',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  'Please use the form below to create an account',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: height * 0.06),
                RegisterForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
