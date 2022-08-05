import 'package:elibrary/services/endpoints/endpoints.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class DeleteItem extends GetxController {
  // delete item using http delete method
  Client _client = Client();
  ProjectApis _projectApis = ProjectApis();

  Future deleteItem(String url) async {
    var response = await _client.delete(
      Uri.parse(url),
      headers: _projectApis.headers,
    );
    return response;
  }

  // Future deleteItem(url) async {
  //   var response = await _client.delete(
  //     Uri.parse(url),
  //     headers: {
  //       'Content-Type': 'application/json',
  //       'Accept': 'application/json',
  //     },
  //   );
  //   return response;
  // }
}
