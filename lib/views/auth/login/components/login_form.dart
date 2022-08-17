import 'package:elibrary/constants/colors.dart';
import 'package:elibrary/controllers/auth/auth.dart';
import 'package:elibrary/model/api_response.dart';
import 'package:elibrary/model/user.dart';
import 'package:elibrary/views/auth/register/register.dart';
import 'package:elibrary/widgets/button_nav.dart';
import 'package:elibrary/widgets/loader.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  GlobalKey<FormState> _formKey = GlobalKey();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool isLoading = false;

  final FocusNode emailNode = FocusNode();
  final FocusNode passwordNode = FocusNode();

  _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  AuthController authController = AuthController();

  loginUser() async {
    ApiResponse response = await authController.loginUser();

    if (response.message == "success") {
      saveAndRedirectToHome(response.data as User);
    } else {
      setState(() {
        isLoading = false;
      });
      // SchedulerBinding.instance.addPostFrameCallback((_) {

      // });
      Get.snackbar(
        "",
        "${response.message}",
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        backgroundColor: Colors.red,
      );
    }
  }

  void saveAndRedirectToHome(User user) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString('token', user.token);
    await pref.setInt('userId', user.id!);
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => BottomNavigation()),
        (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            autofocus: true,
            focusNode: emailNode,
            onFieldSubmitted: (value) {
              _fieldFocusChange(context, emailNode, passwordNode);
            },
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.email,
                color: ProjectColors.grey,
              ),
              labelText: 'Email Address',
              labelStyle: TextStyle(
                fontSize: 16,
                color: ProjectColors.black.withOpacity(0.5),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: ProjectColors.grey,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: ProjectColors.black,
                ),
              ),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your email address';
              }
              return null;
            },
            onSaved: (value) {
              authController.email = value!;
            },
          ),
          SizedBox(height: height * 0.03),
          TextFormField(
            controller: _passwordController,
            obscureText: authController.isPasswordHidden.value,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            focusNode: passwordNode,
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.lock,
                color: ProjectColors.grey,
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  authController.isPasswordHidden.value
                      ? Icons.visibility_off
                      : Icons.visibility,
                  color: Colors.grey,
                ),
                onPressed: () {
                  authController.isPasswordHidden.value =
                      !authController.isPasswordHidden.value;
                },
              ),
              labelText: 'Password',
              labelStyle: TextStyle(
                fontSize: 16,
                color: ProjectColors.black.withOpacity(0.5),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: ProjectColors.grey,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: ProjectColors.black,
                ),
              ),
            ),
            validator: (value) => value!.isEmpty
                ? 'Please enter your password'
                : value.length < 6
                    ? 'Password must be at least 6 characters'
                    : null,
            onSaved: (value) {
              authController.password = value!;
            },
          ),
          SizedBox(height: height * 0.005),
          TextButton(
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                'Forgot Password?',
                style: TextStyle(
                    fontSize: 16, color: ProjectColors.black.withOpacity(0.5)),
              ),
            ),
            onPressed: () {},
          ),
          SizedBox(height: height * 0.005),
          isLoading
              ? CircularProgressIndicator(
                  color: ProjectColors.primary,
                )
              : ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: ProjectColors.primary,
                    minimumSize: Size.fromHeight(height * 0.08),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text('Login', style: TextStyle(fontSize: 16)),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      setState(() {
                        isLoading = true;

                        loginUser();
                      });
                    }
                  },
                ),
          SizedBox(height: height * 0.05),
          RichText(
            text: TextSpan(
              text: 'Don\'t have an account? ',
              style: TextStyle(fontSize: 16, color: Colors.grey),
              children: [
                TextSpan(
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Get.to(
                        () => RegisterScreen(),
                      );
                    },
                  text: 'Create Account',
                  style: TextStyle(fontSize: 16, color: ProjectColors.black),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
