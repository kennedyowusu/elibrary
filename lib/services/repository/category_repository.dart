import 'package:elibrary/services/api/api_client.dart';
import 'package:elibrary/services/endpoints.dart';
import 'package:get/get.dart';

class CategoryRepository extends GetxService {
  final ApiClient apiClient;

  CategoryRepository({required this.apiClient});

  Future<Response> getCategories() async {
    return await apiClient.getRequest(ProjectConstants.CATEGORY_URI);
  }
}
