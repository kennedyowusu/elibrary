import 'package:elibrary/model/department.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../services/department/department.dart';

class DepartmentController extends GetxController {
  RxList<Department> departmentList = <Department>[].obs;

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
      debugPrint("The departmentList is: ${departmentList.toString()}");

      // Sort the departments alphabetically
      // departmentList.sort((a, b) => a.name.compareTo(b.name));

      // Show snackbar with the number of departments
      Get.snackbar(
        'Success',
        '${departmentList.length} departments loaded',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }
}
