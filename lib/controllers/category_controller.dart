import 'package:elibrary/model/categories.dart';
import 'package:elibrary/services/repository/category_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  final CategoryRepository categoryRepository;

  CategoryController({required this.categoryRepository});

  List<Category> categoryList = [];

  bool isLoaded = false;

  Future<void> getCategoryList() async {
    Response response = await categoryRepository.getCategories();

    if (response.statusCode == 200) {
      categoryList = [];

      for (var item in response.body) {
        categoryList.add(Category.fromJson(item));
      }

      debugPrint('Category List: ${categoryList.length}');

      isLoaded = true;
      update();
    } else {
      Get.snackbar(
        "Error Occurred",
        response.statusText.toString(),
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        backgroundColor: Colors.red,
      );
    }
  }
}
