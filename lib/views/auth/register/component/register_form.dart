import 'package:elibrary/constants/colors.dart';
import 'package:elibrary/controllers/auth/auth.dart';
import 'package:elibrary/views/auth/login/login.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  GlobalKey<FormState> _formKey = GlobalKey();

  bool _isShowPassword = false;
  var _isLoading = false;

  AuthController authController = AuthController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.person,
                color: ProjectColors.grey,
              ),
              labelText: 'Full Name',
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
                return 'Please enter your full name';
              }
              return null;
            },
            onSaved: (value) {
              authController.name = value!;
            },
          ),
          SizedBox(height: height * 0.03),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            autovalidateMode: AutovalidateMode.onUserInteraction,
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
            obscureText: !_isShowPassword,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.lock, color: ProjectColors.grey),
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
          SizedBox(height: height * 0.03),
          TextFormField(
            obscureText: !_isShowPassword,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.lock, color: ProjectColors.grey),
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
              labelText: 'Confirm Password',
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
                return 'Please confirm your password';
              }
              if (authController.confirmPassword != authController.password) {
                return 'Password does not match';
              }
              return null;
            },
            onSaved: (value) {
              authController.confirmPassword = value!;
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
            child: Text(
              'Register',
              style: TextStyle(fontSize: 16),
            ),
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();

                await authController.createUserAccount();
              }
            },
          ),
          SizedBox(height: height * 0.03),
          RichText(
            text: TextSpan(
              text: 'Already have an account? ',
              style: TextStyle(fontSize: 16, color: Colors.grey),
              children: [
                TextSpan(
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Get.to(
                        () => LoginScreen(),
                      );
                    },
                  text: 'Login',
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
