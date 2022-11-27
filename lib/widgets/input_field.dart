import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.icon,
    required this.controller,
    this.isPassword = false,
    required this.inputType,
  });

  final String labelText, hintText;
  final IconData icon;
  final TextEditingController controller;
  final bool isPassword;
  final TextInputType inputType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 15.0,
        right: 15.0,
        top: 15,
        bottom: 0,
      ),
      child: TextFormField(
        keyboardType: inputType,
        obscureText: isPassword ? true : false,
        controller: controller,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          prefixIcon: Icon(
            icon,
            color: Color(0xFFC4C4C4),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Color(0xFFC4C4C4)),
          ),
          labelText: labelText,
          labelStyle: TextStyle(
            color: Color(0xFF000000),
          ),
          hintText: hintText,
        ),
      ),
    );
  }
}
