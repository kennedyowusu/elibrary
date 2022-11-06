import 'package:elibrary/controllers/category_controller.dart';
import 'package:get/get.dart';

Future<void> loadResources() async {
  await Get.find<CategoryController>().getCategoryList();
}
