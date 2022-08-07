import 'package:elibrary/services/retrieve/retrieve.dart';
import 'package:get/get.dart';
import 'package:elibrary/model/retrieve.dart';

class RequestsController extends GetxController {
  var requestList = <Retrieve>[].obs;

  void getRequests() async {
    var requestVariable = await RetrieveRequests.fetchRequests();
    requestList.value = requestVariable;
  }
}
