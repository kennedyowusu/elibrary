import 'package:elibrary/model/department.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../services/department/department.dart';

class DepartmentController extends GetxController {
  RxList<Product> departmentList = <Product>[].obs;

  @override
  void onInit() {
    fetchDepartment();
    super.onInit();
  }

  void fetchDepartment() async {
    departmentList.value = await RemoteService().getDepartments();

    if (departmentList.isEmpty) {
      Get.snackbar(
        'Error',
        'No departments found',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } else {
      Get.snackbar(
        'Success',
        'Departments loaded',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }
}
