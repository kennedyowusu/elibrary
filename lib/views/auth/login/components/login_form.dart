import 'package:elibrary/constants/colors.dart';
import 'package:elibrary/controllers/auth/auth.dart';
import 'package:elibrary/views/auth/login/components/login_model.dart';
import 'package:elibrary/views/auth/register/register.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  bool _isShowPassword = false;
  String email = '';
  String password = '';

  AuthController authController = AuthController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.email),
              labelText: 'Email Address',
              labelStyle: TextStyle(fontSize: 16),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your email address';
              }
              return null;
            },
            onSaved: (value) {},
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
          TextFormField(
            controller: _passwordController,
            obscureText: !_isShowPassword,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.lock,
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  _isShowPassword ? Icons.visibility : Icons.visibility_off,
                  color: Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    _isShowPassword = !_isShowPassword;
                  });
                },
              ),
              labelText: 'Password',
              labelStyle: TextStyle(fontSize: 16),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            validator: (value) => value!.isEmpty
                ? 'Please enter your password'
                : value.length < 6
                    ? 'Password must be at least 6 characters'
                    : null,
            onSaved: (value) {
              email = _emailController.text;
            },
          ),
          SizedBox(height: height * 0.03),
          ElevatedButton(
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
                authController.signInUser();
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
