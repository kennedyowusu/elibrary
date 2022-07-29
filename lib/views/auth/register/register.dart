import 'package:elibrary/views/auth/register/component/register_form.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: height * 0.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Create Account',
                style: TextStyle(fontSize: 20),
              ),
              Text(
                'Please use the form below to create an account',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: height * 0.08),
              RegisterForm(),
            ],
          ),
        ),
      ),
    );
  }
}
