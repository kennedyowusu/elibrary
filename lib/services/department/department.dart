import 'dart:convert';
import 'dart:developer';

import 'package:elibrary/model/department.dart';
import 'package:elibrary/services/endpoints/endpoints.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class RemoteService {
  RemoteService();
  ProjectApis _projectApis = ProjectApis();
  Client client = http.Client();

  Future<List<Department>> getDepartments() async {
    http.Response response = await client.get(
      Uri.parse(_projectApis.departmentsUrl),
      headers: _projectApis.headers,
    );

    debugPrint("The response.statusCode is: ${response.statusCode}");

    if (response.statusCode == 200) {
      log("The response.body is: ${response.body}");
      debugPrint("The response body is: ${response.body}");
      debugPrint("The response.statusCode is: ${response.statusCode}");
      return (json.decode(response.body) as List)
          .map((data) => Department.fromJson(data))
          .toList();
    } else {
      throw Exception('Failed to load departments');
    }
  }
}
