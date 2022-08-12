import 'package:elibrary/constants/colors.dart';
import 'package:flutter/material.dart';

class ProjectStyle {
  static padding(context) {
    double height = MediaQuery.of(context).size.height;
    return EdgeInsets.symmetric(horizontal: height * 0.02);
  }

  static margin(context) {
    double height = MediaQuery.of(context).size.height;
    return EdgeInsets.symmetric(horizontal: height * 0.02);
  }

  static borderRadius(context) {
    double height = MediaQuery.of(context).size.height;
    return BorderRadius.circular(height * 0.02);
  }

  static border(context) {
    double height = MediaQuery.of(context).size.height;
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(height * 0.02),
    );
  }

  static textStyle(BuildContext context,
      {required Color color,
      required double size,
      required FontWeight weight}) {
    double height = MediaQuery.of(context).size.height;
    return TextStyle(
      fontSize: size,
      fontWeight: weight,
      color: color,
    );
  }
}
