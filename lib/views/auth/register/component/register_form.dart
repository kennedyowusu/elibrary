import 'package:elibrary/constants/colors.dart';
import 'package:elibrary/services/endpoints.dart';
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
  TextEditingController _emailController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  bool _isShowPassword = false;
  String email = '';
  String name = '';
  String password = '';

  AuthService authService = Get.put(AuthService());

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _nameController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.person),
              labelText: 'Full Name',
              labelStyle: TextStyle(fontSize: 16),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your full name';
              }
              return null;
            },
            onSaved: (value) {
              name = value!;
            },
          ),
          SizedBox(height: height * 0.03),
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
            onSaved: (value) {
              email = value!;
            },
          ),
          SizedBox(height: height * 0.03),
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
              password = value!;
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
              if (_formKey.currentState?.validate() ?? false) {
                await authService.registerUser(name, email, password);
              }
            },
          ),
          SizedBox(height: height * 0.05),
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
