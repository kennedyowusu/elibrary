import 'package:elibrary/services/requests/requests.dart';
import 'package:get/get.dart';
import 'package:elibrary/model/requests.dart';

class RequestsController extends GetxController {
  var requestList = <Requests>[].obs;

  void getRequests() async {
    var requestVariable = await RetrieveRequests.fetchRequests();
    requestList.value = requestVariable;
  }
}
