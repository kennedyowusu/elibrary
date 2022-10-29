import 'package:elibrary/constants/colors.dart';
import 'package:elibrary/constants/images.dart';
import 'package:elibrary/views/auth/forgot_password/component/forgot_password_form.dart';
import 'package:elibrary/views/auth/login/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordBody extends StatelessWidget {
  ForgotPasswordBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
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
          'Reset Your Password',
          style: TextStyle(
            color: ProjectColors.primary,
            fontSize: fontSize.width * 0.05,
          ),
        ),
        SizedBox(height: height * 0.05),
        ForgotPasswordForm(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You remember your password?',
              style: TextStyle(
                color: Color(0xFF000000),
                fontSize: fontSize.width * 0.035,
              ),
            ),
            TextButton(
              onPressed: () {
                Get.to(() => LoginView(), transition: Transition.rightToLeft);
              },
              child: Text(
                'Sign In',
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
