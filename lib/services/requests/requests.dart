import 'package:elibrary/model/requests.dart';
import 'package:elibrary/services/endpoints/endpoints.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:http/http.dart' as http;

class RetrieveRequests {
  RetrieveRequests();
  static var client = http.Client();
  ProjectApis projectApis = ProjectApis();

  static Future<List<Requests>> fetchRequests() async {
    final response = await client.get(
      Uri.parse(ProjectApis.requestUrl),
    );
    if (response.statusCode == HttpStatus.ok) {
      // Call is successful
      var jsonString = response.body;
      return requestsListFromJson(jsonString);
    } else {
      // If that call was not successful, throw an error.
      Get.snackbar(
        'Error',
        'Failed to load requests',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      throw Exception('');
    }
  }
}
