import 'dart:convert';

import 'package:elibrary/model/department.dart';
import 'package:elibrary/services/endpoints/endpoints.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class RemoteService {
  RemoteService();
  ProjectApis _projectApis = ProjectApis();
  Client client = http.Client();

  Future<List<Product>> getDepartments() async {
    http.Response response = await client.get(
      Uri.parse(
        'https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline',
      ),
    );

    if (response.statusCode == 200) {
      debugPrint("The response body is: ${response.body}");
      return (json.decode(response.body) as List)
          .map((data) => Product.fromJson(data))
          .toList();
    } else {
      throw Exception('Failed to load departments');
      // return null;
    }
  }
}
