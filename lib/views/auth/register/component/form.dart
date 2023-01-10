import 'package:elibrary/constants/colors.dart';
import 'package:elibrary/controllers/authentication_controller.dart';
import 'package:elibrary/model/authentication.dart';
import 'package:elibrary/routes/routes.dart';
import 'package:elibrary/widgets/display_name.dart';
import 'package:elibrary/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// ignore: unused_import
import 'package:shared_preferences/shared_preferences.dart';

class RegisterForm extends StatefulWidget {
  RegisterForm({Key? key}) : super(key: key);

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _registerFormKey = GlobalKey<FormState>();

  TextEditingController registerEmailController = TextEditingController();

  TextEditingController registerDisplayNameController = TextEditingController();

  TextEditingController registerPasswordController = TextEditingController();

  TextEditingController registerPasswordConfirmationController =
      TextEditingController();

  final authenticationController = Get.put(AuthenticationController());

  @override
  void dispose() {
    super.dispose();
    registerEmailController.dispose();
    registerDisplayNameController.dispose();
    registerPasswordController.dispose();
    registerPasswordConfirmationController.dispose();
  }

  void registerUser(AuthenticationController authenticationController) {
    String name = registerDisplayNameController.text.trim();
    String email = registerEmailController.text.trim();
    String password = registerPasswordController.text.trim();
    String confirmPassword = registerPasswordConfirmationController.text.trim();

    if (name.isEmpty) {
      displayCustomSnackBar(title: "Full Name", "Full Name is required");
      return;
    } else if (email.isEmpty) {
      displayCustomSnackBar(
          title: "Student Email Address", "Student Email Address is required");
      return;
    } else if (!GetUtils.isEmail(email)) {
      displayCustomSnackBar(
        title: "Invalid Email Address",
        "Enter valid Email Address",
      );
    } else if (password.isEmpty) {
      displayCustomSnackBar(title: "Password", "Password is required");
      return;
    } else if (password.length < 6) {
      displayCustomSnackBar(
          title: "Password Length", "Password must be at least 6 characters");
    } else if (confirmPassword.isEmpty) {
      displayCustomSnackBar(
          title: "Password Confirmation", "Confirm Your Password");
      return;
    } else if (password != confirmPassword) {
      displayCustomSnackBar(
          title: "Password Confirmation", "Passwords do not match");
      return;
    } else {
      AuthModel authModel = AuthModel(
        name: name,
        email: email,
        password: password,
        confirmPassword: confirmPassword,
      );
      debugPrint(authModel.toString());
      authenticationController.registration(authModel).then((status) => {
            if (status.isSuccess)
              {
                Get.offNamed(
                  RouteHelper.getInitialRoute(),
                ),
                debugPrint(authModel.toString()),
              }
            else
              {
                displayCustomSnackBar(
                  title: "Error Occurred",
                  status.message,
                ),
              }
          });
    }
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
          InputField(
            inputType: TextInputType.name,
            controller: registerDisplayNameController,
            labelText: "Full Name",
            hintText: "Enter your Full Name",
            icon: Icons.person,
          ),
          InputField(
            inputType: TextInputType.emailAddress,
            controller: registerEmailController,
            labelText: "Student Email Address",
            hintText: "Enter your Student Email Address",
            icon: Icons.email,
          ),
          InputField(
            inputType: TextInputType.visiblePassword,
            isPassword: true,
            controller: registerPasswordController,
            labelText: "Password",
            hintText: "Enter your Password",
            icon: Icons.password,
          ),
          InputField(
            inputType: TextInputType.visiblePassword,
            isPassword: true,
            controller: registerPasswordConfirmationController,
            labelText: "Confirm Password",
            hintText: "confirm your Password",
            icon: Icons.password,
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
              child: Obx(
                () => TextButton(
                  onPressed: () {
                    registerUser(authenticationController);
                  },
                  child: Text(
                    "Sign Up",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
