import 'package:elibrary/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordForm> createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  final _forgotPasswordFormKey = GlobalKey<FormState>();

  String? email;
  bool isLoading = false;
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    String? validateEmail(String value) {
      // if (!GetUtils.isEmail(value)) {
      //   return ErrorMessages.kInvalidEmailError;
      // } else if (value.isEmpty) {
      //   return ErrorMessages.kEmailNullError;
      // }

      return null;
    }

    bool validatePasswordReset() {
      final form = _forgotPasswordFormKey.currentState;

      return false;
    }

    return Form(
      key: _forgotPasswordFormKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              onSaved: (value) => email = value,
              validator: (context) => validateEmail(emailController.text),
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
                hintText: 'Enter Student E mail Address',
              ),
            ),
          ),
          SizedBox(height: height * 0.03),
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
                  validatePasswordReset();
                },
                child: Text(
                  "Send",
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
