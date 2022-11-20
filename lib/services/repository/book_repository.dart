import 'package:elibrary/services/endpoints.dart';
import 'package:elibrary/services/requests.dart';
import 'package:get/get.dart';

class BookRepository extends GetxService {
  ApiClient apiClient = ApiClient();

  Future<Response> fetchBooks() async {
    return apiClient.getRequest(ProjectConstants.BOOKS_URI);
  }
}
