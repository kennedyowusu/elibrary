import 'package:elibrary/services/retrieve/retrieve.dart';
import 'package:get/get.dart';
import 'package:elibrary/model/retrieve.dart';

class RetrieveController extends GetxController {
  RxList<Retrieve> requestList = <Retrieve>[].obs;

  void getRequests() async {
    List<Retrieve> requestVariable = await RetrieveRequests.fetchRequests();
    requestList.value = requestVariable;
  }
}
