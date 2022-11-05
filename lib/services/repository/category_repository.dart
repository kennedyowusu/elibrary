import 'package:elibrary/services/requests.dart';
import 'package:elibrary/services/endpoints.dart';
import 'package:get/get.dart';

class CategoryRepository extends GetxService {
  ApiClient apiClient = ApiClient();

  Future<Response> getCategories() async {
    return await apiClient.getRequest(ProjectConstants.CATEGORY_URI);
  }
}
