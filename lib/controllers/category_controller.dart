import 'dart:io';

import 'package:elibrary/model/categories.dart';
import 'package:elibrary/services/repository/category_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  CategoryRepository categoryRepository = CategoryRepository();

  RxList<Category> categoryList = <Category>[].obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getCategoryList();
  }

  Future<void> getCategoryList() async {
    isLoading(true);
    try {
      Response categoryResponse = await categoryRepository.getCategories();
      if (categoryResponse.statusCode == 200) {
        Map<String, dynamic> categoryMap = categoryResponse.body;

        categoryMap.forEach((key, value) {
          debugPrint("key = $key, value = $value");
        });

        debugPrint("result = ${categoryResponse.bodyString}");

        categoryList.assignAll(
          categoryFromJson(categoryResponse.bodyString ?? ''),
        );
      } else {
        showErrorMessage(categoryResponse, "Error Occurred").show();
        debugPrint(categoryResponse.bodyString ?? '');
        debugPrint(
          categoryResponse.statusText.toString(),
        );
      }
    } on SocketException {
      GetSnackBar(
        message: "No Internet Connectivity",
        duration: Duration(seconds: 5),
      ).show();
    } catch (e) {
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
  }

  SnackbarController showErrorMessage(
      Response<dynamic> categoryResponse, String message) {
    return Get.snackbar(
      "Error Occurred",
      categoryResponse.statusText.toString(),
      snackPosition: SnackPosition.BOTTOM,
      colorText: Colors.white,
      backgroundColor: Colors.red,
    );
  }
}
