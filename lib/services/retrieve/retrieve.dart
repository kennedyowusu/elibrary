import 'dart:convert';

import 'package:elibrary/model/retrieve.dart';
import 'package:elibrary/services/endpoints/endpoints.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class RetrieveRequests {
  static http.Client client = http.Client();
  static ProjectApis projectApis = ProjectApis();

  static Future<List<Retrieve>> fetchRequests() async {
    final response = await client.get(
      Uri.parse(ProjectApis.requestUrl),
      headers: projectApis.headers,
    );
    if (response.statusCode == 200) {
      return (json.decode(response.body) as List)
          .map((data) => Retrieve.fromJson(data))
          .toList();
    } else {
      Get.snackbar(
        'Error',
        'Failed to load requests',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      throw Exception('');
    }
  }

  static Future<List<Retrieve>> fetchRequestsByUser(String userId) async {
    final response = await client.get(
      Uri.parse(ProjectApis.requestUrl + '/$userId'),
      headers: projectApis.headers,
    );
    if (response.statusCode == 200) {
      return (json.decode(response.body) as List)
          .map((data) => Retrieve.fromJson(data))
          .toList();
    } else {
      Get.snackbar(
        'Error',
        'Failed to load requests',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      throw Exception('');
    }
  }

  // delete request
  static Future<void> deleteRequest(String requestId) async {
    final response = await client.delete(
      Uri.parse(ProjectApis.requestUrl + '/$requestId'),
      headers: projectApis.headers,
    );
    if (response.statusCode == 200) {
      Get.snackbar(
        'Success',
        'Request deleted successfully',
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } else {
      Get.snackbar(
        'Error',
        'Failed to delete request',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      throw Exception('');
    }
  }
}
