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
    Response categoryResponse = await categoryRepository.getCategories();

    if (categoryResponse.statusCode == 200) {
      List<Category> categories =
          categoryFromJson(categoryResponse.bodyString ?? "[]");
      categoryList.assignAll(categories);
    } else {
      Get.snackbar(
        "Error Occurred",
        categoryResponse.statusText.toString(),
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        backgroundColor: Colors.red,
      );
    }
    isLoading(false);
  }
}
