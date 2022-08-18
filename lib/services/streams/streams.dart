import 'package:elibrary/model/streams.dart';
import 'package:elibrary/services/endpoints/endpoints.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class RemoteServices {
  static var client = http.Client();
  ProjectApis projectApis = ProjectApis();

  // Return a list of streams from the server
  static Future<List<Streams>> getStreams() async {
    http.Response response = await client.get(
      Uri.parse(ProjectApis.streamsUrl),
    );
    debugPrint(response.body);

    if (response.statusCode == 200) {
      var jsonString = (response.body);
      return streamsListFromJson(jsonString);
    } else {
      // If that call was not successful, throw an error.
      Get.snackbar(
        'Error',
        'Failed to load streams',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
    throw Exception('Failed to load streams');
  }
}
