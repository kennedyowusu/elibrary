import 'package:elibrary/widgets/medium_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

SnackbarController showSnackBar(String title, String message) {
  return Get.snackbar(
    title,
    message,
    snackPosition: SnackPosition.BOTTOM,
    colorText: Colors.white,
    backgroundColor: Colors.red,
  );
}

void displayCustomSnackBar(String message,
    {Color? color, bool isError = true, String title = "Error Occurred"}) {
  Get.snackbar(
    title,
    message,
    titleText: MediumText(
      text: title,
      color: Colors.white,
    ),
    messageText: MediumText(
      text: message,
      color: Colors.white,
    ),
    snackPosition: SnackPosition.BOTTOM,
    colorText: Colors.white,
    backgroundColor: Colors.red,
  );
}
