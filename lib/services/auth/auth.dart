import 'dart:convert';

import 'package:elibrary/services/endpoints/endpoints.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthService {
  ProjectApis projectApis = ProjectApis();
  static var client = http.Client();

  Future<http.Response> signUpUser(
    String name,
    String email,
    String password,
    String confirmPassword,
  ) async {
    Map data = {
      'name': name,
      'email': email,
      'password': password,
      'password_confirmation': confirmPassword,
    };
    var body = json.encode(data);
    var url = Uri.parse(projectApis.registerUrl);

    var response = await client.post(
      url,
      body: body,
      headers: projectApis.headers,
    );
    debugPrint(response.body);
    return response;
  }

  Future<http.Response> signInUser(
    String email,
    String password,
  ) async {
    Map data = {
      'email': email,
      'password': password,
    };
    var body = json.encode(data);
    var url = Uri.parse(projectApis.loginUrl);

    var response = await client.post(
      url,
      body: body,
      headers: projectApis.headers,
    );
    debugPrint(response.body);
    return response;
  }

  Future<http.Response> signOutUser() async {
    var url = Uri.parse(projectApis.logoutUrl);
    var response = await client.get(
      url,
      headers: projectApis.headers,
    );
    return response;
  }

  Future<http.Response> resetPassword(String email) async {
    Map data = {
      'email': email,
    };
    var body = json.encode(data);
    var url = Uri.parse(projectApis.resetPasswordUrl);

    var response = await client.post(
      url,
      body: body,
      headers: projectApis.headers,
    );
    return response;
  }
}
