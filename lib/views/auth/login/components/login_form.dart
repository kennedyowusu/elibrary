import 'dart:convert';
import 'dart:io';

import 'package:elibrary/constants/colors.dart';
import 'package:elibrary/controllers/auth/auth.dart';
import 'package:elibrary/model/user.dart';
import 'package:elibrary/services/endpoints/endpoints.dart';
import 'package:elibrary/utils/shared_prefs.dart';
import 'package:elibrary/views/auth/register/register.dart';
import 'package:elibrary/views/home/home.dart';
import 'package:elibrary/widgets/error.dart';
import 'package:elibrary/widgets/loader.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  String email = '';
  String password = '';

  final FocusNode emailNode = FocusNode();
  final FocusNode passwordNode = FocusNode();

  _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  AuthController authController = AuthController();
  ProjectApis projectApis = ProjectApis();

  // loginUserNew(BuildContext context) async{
  //   if(_formKey.currentState!.validate() == false) return null; {

  //     setState(() {
  //       _isLoading = true;
  //     });
  //     await authController.loginUser(email, password);
  //     setState(() {
  //       _isLoading = false;
  //     });
  //   }
  // }

  loginUserNew(BuildContext context) async {
    if (_formKey.currentState!.validate() == false) return null;
    _formKey.currentState!.save();

    showLoaderDialog(context, message: 'Logging in...');

    http.Response response = await http.post(
      Uri.parse(projectApis.loginUrl),
      headers: projectApis.headers,
      body: json.encode({
        'email': email,
        'password': password,
      }),
    );
    if (response.statusCode == 200 || response.body != '') {
      Map<String, dynamic> responseData = json.decode(response.body);
      debugPrint(responseData.toString());
      if (responseData['status'] == 'success') {
        var userData = User.fromJson(responseData['data']);
        debugPrint("login: token=${userData.token}");
        Directory documentDirectory = await getApplicationDocumentsDirectory();
        userData.applicationDirPath = documentDirectory.path;
        UserPreferences().setUser(userData);
        Navigator.pop(context);
        Get.offAll(() => HomeView());
        return;
      } else {
        Navigator.pop(context);
        showErrorDialog(context, message: responseData['message']);
        return;
      }
    } else {
      Navigator.pop(context);
      Map<String, dynamic> responseData = json.decode(response.body);
      showErrorDialog(context,
          message: responseData['message'] ?? 'Server Error');
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
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
          Obx(() => TextFormField(
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
              )),
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
                // authController.signInUser();
                loginUserNew(context);
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
