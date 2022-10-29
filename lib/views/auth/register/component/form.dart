import 'package:elibrary/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterForm extends StatefulWidget {
  RegisterForm({Key? key}) : super(key: key);

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _registerFormKey = GlobalKey<FormState>();

  String name = '';

  String email = '';

  String password = '';

  bool isLoading = false;

  TextEditingController registerEmailController = TextEditingController();

  TextEditingController registerDisplayNameController = TextEditingController();

  TextEditingController registerPasswordController = TextEditingController();

  // LoadingIndicator loadingIndicator = Get.put(LoadingIndicator());

  @override
  void dispose() {
    super.dispose();
    registerEmailController.dispose();
    registerDisplayNameController.dispose();
    registerPasswordController.dispose();
  }

  String? validateName(String value) {
    // if (value.isEmpty) {
    //   return ErrorMessages.kNameNullError;
    // } else if (ErrorMessages.nameValidatorRegExp.hasMatch(value)) {
    //   return ErrorMessages.kInvalidNameError;
    // } else if (value.length < 3) {
    //   return ErrorMessages.kShortNameError;
    // }
    return null;
  }

  String? validateEmail(String value) {
    // Check if this field is empty
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }

    // using regular expression
    if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
      return "Please enter a valid email address";
    }

    // the email is valid
    return null;
  }

  String? validatePassword(String value) {
    if (value.isEmpty) {
      return 'Password is required';
    } else if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  Future<bool> validateRegistration() async {
    final form = _registerFormKey.currentState;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (form!.validate()) {
      form.save();

      prefs.setString('email', registerEmailController.text);
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Form(
      key: _registerFormKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          Padding(
            padding:
                EdgeInsets.only(left: 15.0, right: 15.0, top: 15, bottom: 0),
            child: TextFormField(
              controller: registerDisplayNameController,
              onSaved: (value) => name = value!,
              validator: (context) =>
                  validateName(registerDisplayNameController.text.trim()),
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  prefixIcon: Icon(
                    Icons.person,
                    color: Color(0xFFC4C4C4),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Color(0xFFC4C4C4)),
                  ),
                  labelText: 'Full Name',
                  labelStyle: TextStyle(
                    color: Color(0xFF000000),
                  ),
                  hintText: 'Enter Full Name'),
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(left: 15.0, right: 15.0, top: 15, bottom: 0),
            child: TextFormField(
              controller: registerEmailController,
              keyboardType: TextInputType.emailAddress,
              onSaved: (value) => email = value!,
              validator: (value) {
                validateEmail(registerEmailController.text.trim());
                return null;
              },
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
                labelText: 'Student Index Number',
                labelStyle: TextStyle(
                  color: Color(0xFF000000),
                ),
                hintText: 'Enter Student Index Number',
              ),
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(left: 15.0, right: 15.0, top: 15, bottom: 0),
            child: TextFormField(
              controller: registerPasswordController,
              onSaved: (value) => password = value!,
              validator: (String? value) {
                validatePassword(registerPasswordController.text.trim());
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
          SizedBox(height: height * 0.02),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            height: 55,
            width: width * 0.85,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: ProjectColors.primary,
            ),
            child: ClipRect(
              child: TextButton(
                onPressed: () {
                  validateRegistration();
                },
                child: Text(
                  "Sign Up",
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
