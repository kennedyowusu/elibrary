import 'package:elibrary/services/endpoints.dart';
import 'package:get/get.dart';

class ApiClient extends GetConnect implements GetxService {
  ApiClient() {
    baseUrl = ProjectConstants.BASE_URL;
    timeout = Duration(seconds: 30);
  }

  final mainHeaders = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer Token Here',
  };

  // retrieve data from the server - get request
  Future<Response> getRequest(String uri) async {
    try {
      Response response = await get(uri, headers: mainHeaders);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}
