import 'dart:convert';

import 'package:elibrary/services/endpoints/endpoints.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart';

class PostController extends GetxController {
  final String url = ProjectApis.requestUrl;
  ProjectApis _projectApis = ProjectApis();

  Client _client = Client();

  postRequest(userData, url) async {
    var response = await _client.post(
      Uri.parse(url),
      body: json.encode(userData),
      headers: _projectApis.headers,
    );
    return response;
  }
}
