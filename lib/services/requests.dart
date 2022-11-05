import 'package:get/get.dart';

class ApiClient extends GetConnect implements GetxService {
  late String token;
  final String baseUrl;
  late Map<String, String> mainHeaders;

  ApiClient({required this.baseUrl}) {
    baseUrl = baseUrl;
    timeout = Duration(seconds: 30);
    mainHeaders = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
  }

  // retrieve data from the server - get request
  Future<Response> getRequest(String uri,
      {Map<String, String>? headers}) async {
    try {
      Response response = await get(uri, headers: headers ?? mainHeaders);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}
