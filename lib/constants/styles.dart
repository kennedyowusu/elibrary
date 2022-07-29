import 'package:flutter/material.dart';

class ProjectStyle {
  static padding(context) {
    double height = MediaQuery.of(context).size.height;
    return EdgeInsets.symmetric(horizontal: height * 0.02);
  }
}
