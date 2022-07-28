import 'package:elibrary/constants/colors.dart';
import 'package:elibrary/views/auth/login/components/login_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> formKey = GlobalKey();
  LoginViewModel _viewModel = Get.put(LoginViewModel());

  TextEditingController emailCtr = TextEditingController();
  TextEditingController passwordCtr = TextEditingController();
  FormType _formType = FormType.login;

  //_formType == FormType.login ? Text('Login') : Text('Register')

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;

    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
              vertical: height * 0.08, horizontal: width * 0.08),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 0.05 * height),
                child: Text(
                  FormType.login == _formType ? 'Login' : 'Register',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              _formType == FormType.login
                  ? loginForm(height, width)
                  : registerForm(height, width),
            ],
          ),
        ),
      ),
    );
  }

  Form loginForm(height, width) {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: formKey,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        TextFormField(
          controller: emailCtr,
          validator: (value) {
            return (value == null || value.isEmpty)
                ? 'Please Enter Email'
                : null;
          },
          decoration: inputDecoration('E-mail', Icons.person),
        ),
        SizedBox(
          height: height * 0.01,
        ),
        TextFormField(
          validator: (value) {
            return (value == null || value.isEmpty)
                ? 'Please Enter Password'
                : null;
          },
          controller: passwordCtr,
          decoration: inputDecoration('Password', Icons.lock),
        ),
        SizedBox(
          height: height * 0.04,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: ProjectColors.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () async {
            if (formKey.currentState?.validate() ?? false) {
              await _viewModel.loginUser(emailCtr.text, passwordCtr.text);
            }
          },
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.31,
              vertical: height * 0.022,
            ),
            child: Text('Login'),
          ),
        ),
        TextButton(
          style: TextButton.styleFrom(
            primary: ProjectColors.primary,
            shadowColor: ProjectColors.white,
          ),
          onPressed: () {
            setState(() {
              _formType = FormType.register;
            });
          },
          child: Text(
            'Don\'t have an account?',
            style: TextStyle(fontSize: 16, color: ProjectColors.black),
          ),
        )
      ]),
    );
  }

  Form registerForm(height, width) {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: formKey,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        TextFormField(
          controller: emailCtr,
          validator: (value) {
            return (value == null || value.isEmpty)
                ? 'Please Enter Email'
                : null;
          },
          decoration: inputDecoration('E-mail', Icons.person),
        ),
        SizedBox(
          height: height * 0.01,
        ),
        TextFormField(
          obscureText: true,
          validator: (value) {
            return (value == null || value.isEmpty)
                ? 'Please Enter Password'
                : null;
          },
          controller: passwordCtr,
          decoration: inputDecoration('Password', Icons.lock),
        ),
        SizedBox(
          height: height * 0.01,
        ),
        TextFormField(
          validator: (value) {
            return (value == null || value.isEmpty || value != passwordCtr.text)
                ? 'Passwords does not match'
                : null;
          },
          decoration: inputDecoration('Retype Password', Icons.lock),
        ),
        SizedBox(
          height: height * 0.04,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: ProjectColors.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            shadowColor: ProjectColors.white,
          ),
          onPressed: () async {
            if (formKey.currentState?.validate() ?? false) {
              await _viewModel.registerUser(emailCtr.text, passwordCtr.text);
            }
          },
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.31,
              vertical: height * 0.022,
            ),
            child: Text(
              'Register',
            ),
          ),
        ),
        TextButton(
          style: TextButton.styleFrom(
            primary: ProjectColors.primary,
            shadowColor: ProjectColors.white,
          ),
          onPressed: () {
            setState(() {
              _formType = FormType.login;
            });
          },
          child: RichText(
            text: TextSpan(
              text: 'Already have an account? ',
              style: TextStyle(
                fontSize: 16,
                color: ProjectColors.black,
              ),
              children: [
                TextSpan(
                  text: 'Login',
                  style: TextStyle(
                    fontSize: 16,
                    color: ProjectColors.primary,
                  ),
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }
}

InputDecoration inputDecoration(String labelText, IconData iconData,
    {String? prefix, String? helperText}) {
  return InputDecoration(
    contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
    helperText: helperText,
    labelText: labelText,
    labelStyle: TextStyle(color: Colors.grey),
    fillColor: Colors.grey.shade200,
    filled: true,
    prefixText: prefix,
    prefixIcon: Icon(
      iconData,
      size: 20,
    ),
    prefixIconConstraints: BoxConstraints(minWidth: 60),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.black)),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.black)),
    errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.black)),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.black)),
  );
}

enum FormType { login, register }
