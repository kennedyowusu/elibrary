import 'package:elibrary/services/endpoints.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ApiClient extends GetConnect implements GetxService {
  late String token;
  late Map<String, String> mainHeaders;

  ApiClient() {
    baseUrl = ProjectConstants.BASE_URL;
    timeout = Duration(seconds: 30);
    token = ProjectConstants.TOKEN;
    mainHeaders = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
  }

  void updateHeaders(String token) {
    mainHeaders = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
  }

  // retrieve data from the server - get request
  Future<Response> getRequest(String uri) async {
    try {
      Response response = await get(uri, headers: mainHeaders);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  // A request to post data to the server
  Future<Response> postRequest(String uri, Map<String, dynamic> body) async {
    debugPrint(body.toString());
    try {
      Response response = await post(uri, body, headers: mainHeaders);
      debugPrint(response.toString());
      return response;
    } catch (e) {
      debugPrint(e.toString());
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}
