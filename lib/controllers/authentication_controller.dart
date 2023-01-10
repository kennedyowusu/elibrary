import 'dart:io';

import 'package:elibrary/model/authentication.dart';
import 'package:elibrary/model/response.dart';
import 'package:elibrary/services/repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthenticationController extends GetxController implements GetxService {
  AuthenticationRepository authenticationRepository =
      AuthenticationRepository();

  RxBool isLoading = false.obs;

  Future<ResponseModel> registration(AuthModel authModel) async {
    isLoading(true);
    Response response = await authenticationRepository.registration(authModel);
    late ResponseModel responseModel;

    try {
      if (response.statusCode == 200) {
        authenticationRepository.saveUserTokenAfterRegistration(
          response.body['token'],
        );

        responseModel = ResponseModel(
          true,
          response.body["token"],
        );
      } else {
        responseModel = ResponseModel(false, response.statusText!.toString());
        GetSnackBar(
          message: responseModel.message,
          duration: Duration(seconds: 5),
        ).show();
      }
    } on SocketException {
      GetSnackBar(
        message: "No Internet Connectivity",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        duration: Duration(seconds: 5),
      ).show();
    } catch (e) {
      debugPrint(
        e.toString(),
      );
      Get.snackbar(
        "Error Occurred",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        backgroundColor: Colors.green,
        duration: Duration(seconds: 5),
      ).show();
    } finally {
      isLoading(false);
    }
    return responseModel;
  }
}
