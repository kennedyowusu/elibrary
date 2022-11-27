import 'package:elibrary/constants/colors.dart';
import 'package:elibrary/routes/routes.dart';
import 'package:elibrary/views/auth/forgot_password/forgot_password.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginForm extends StatefulWidget {
  LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _loginFormKey = GlobalKey<FormState>();

  String? email;

  String? password;

  bool isLoading = false;

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  String? validateEmail(String value) {
    // if (!GetUtils.isEmail(value)) {
    //   return ErrorMessages.kInvalidEmailError;
    // } else if (value.isEmpty) {
    //   return ErrorMessages.kEmailNullError;
    // }

    return null;
  }

  Future<bool> checkLogin() async {
    return false;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Form(
      key: _loginFormKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: TextFormField(
              controller:
                  emailController.text.trim().isEmpty ? emailController : null,
              keyboardType: TextInputType.emailAddress,
              onSaved: (value) => email = value,
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.auto,
                prefixIcon: Icon(
                  Icons.email,
                  color: Color(0xFFC4C4C4),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Color(0xFFC4C4C4)),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                labelText: 'Student Email Address',
                labelStyle: TextStyle(
                  color: Color(0xFF000000),
                ),
                hintText: 'Enter Student Email Address',
              ),
              validator: (context) => validateEmail(emailController.text),
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(left: 15.0, right: 15.0, top: 15, bottom: 0),
            child: TextFormField(
              controller: passwordController.text.trim() == ''
                  ? passwordController
                  : null,
              onSaved: (value) => password = value,
              validator: (String? value) {
                if (value!.isEmpty) {
                  return 'Password is required';
                } else if (value.length < 6) {
                  return 'Password must be at least 6 characters';
                }
                return null;
              },
              obscureText: true,
              decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Color(0xFFC4C4C4),
                  ),
                  suffixIcon: Icon(
                    Icons.visibility_off,
                    color: Color(0xFFC4C4C4),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Color(0xFFC4C4C4)),
                  ),
                  labelText: 'Password',
                  labelStyle: TextStyle(
                    color: Color(0xFF000000),
                  ),
                  hintText: 'Enter Password'),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                Get.to(
                  () => ForgotPasswordView(),
                );
              },
              child: Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: Text(
                  'Forgot Password',
                  style: TextStyle(
                    color: Color.fromRGBO(37, 168, 132, 1),
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            height: 55,
            width: width * 0.85,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: ProjectColors.primary),
            child: ClipRect(
              child: TextButton(
                onPressed: () {
                  Get.toNamed(RouteHelper.getInitialRoute());
                },
                child: Text(
                  "Sign In",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
