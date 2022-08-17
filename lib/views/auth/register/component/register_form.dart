import 'package:elibrary/constants/colors.dart';
import 'package:elibrary/controllers/auth/auth.dart';
import 'package:elibrary/model/api_response.dart';
import 'package:elibrary/model/user.dart';
import 'package:elibrary/views/auth/login/login.dart';
import 'package:elibrary/widgets/button_nav.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  GlobalKey<FormState> _formKey = GlobalKey();

  TextEditingController nameController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  AuthController authController = AuthController();

  bool isLoading = false;

  registerUser() async {
    ApiResponse response = await authController.register(
      nameController.text,
      mailController.text,
      passwordController.text,
    );

    if (response.message == "success") {
      saveAndRedirect(response.data as User);
    } else {
      setState(() {
        isLoading = false;
      });
      Get.snackbar(
        "",
        "${response.message}",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  void saveAndRedirect(User user) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString('token', user.token);

    Get.offAll(BottomNavigation());
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: nameController,
            keyboardType: TextInputType.text,
            autovalidateMode: AutovalidateMode.onUserInteraction,
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
            controller: mailController,
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
              bool emailValid = RegExp(
                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
              ).hasMatch(
                mailController.text.trim(),
              );

              if (value!.isEmpty) {
                return 'Please enter your email';
              } else if (!emailValid) {
                return 'Please enter a valid email';
              }
              return null;
            },
            onSaved: (value) {
              authController.email = value!;
            },
          ),
          SizedBox(height: height * 0.03),
          TextFormField(
            controller: passwordController,
            obscureText: authController.isPasswordHidden.value,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.lock, color: ProjectColors.grey),
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
            onSaved: (value) {
              authController.password = value!;
            },
            validator: (text) {
              String? _msg;

              if (text!.isEmpty) {
                _msg = "Your password is required";
              }
              return _msg;
            },
          ),
          SizedBox(height: height * 0.03),
          TextFormField(
            obscureText: authController.isPasswordHidden.value,
            controller: confirmPasswordController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.lock, color: ProjectColors.grey),
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
            validator: (text) {
              String? _msg;

              if (text!.isEmpty) {
                _msg = "Your password is required";
              } else if (authController.confirmPassword !=
                  authController.password) {
                return "Password must be same as above";
              }
              return _msg;
            },
            onSaved: (value) {
              authController.confirmPassword = value!;
            },
          ),
          SizedBox(height: height * 0.03),
          isLoading
              ? CircularProgressIndicator(
                  color: ProjectColors.primary,
                )
              : ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();

                      setState(() {
                        isLoading = true;
                        registerUser();
                      });
                    }
                  },
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
