import 'package:elibrary/constants/colors.dart';
import 'package:elibrary/constants/images.dart';
import 'package:elibrary/views/auth/login/component/form.dart';
import 'package:elibrary/views/auth/register/register.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginBody extends StatelessWidget {
  LoginBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    Size fontSize = MediaQuery.of(context).size;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(height: height * 0.10),
        Center(
          child: SizedBox(
            width: 200,
            height: 150,
            child: Image.asset(ProjectImages.logo),
          ),
        ),
        SizedBox(height: height * 0.05),
        Text(
          'Welcome Back!',
          style: TextStyle(
            color: ProjectColors.primary,
            fontSize: fontSize.width * 0.05,
          ),
        ),
        SizedBox(height: height * 0.05),
        LoginForm(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Don\'t have an account?',
              style: TextStyle(
                color: Color(0xFF000000),
                fontSize: fontSize.width * 0.035,
              ),
            ),
            TextButton(
              onPressed: () {
                Get.to(() => RegisterView(),
                    transition: Transition.rightToLeft);
              },
              child: Text(
                'Sign Up',
                style: TextStyle(
                  color: Color.fromRGBO(37, 168, 132, 1),
                  fontSize: fontSize.width * 0.035,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  SizedBox Space(height) => SizedBox(height: height);
}
