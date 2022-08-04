import 'package:elibrary/model/streams.dart';
import 'package:elibrary/services/streams/streams.dart';
import 'package:get/get.dart';

class StreamsController extends GetxController {
  var streamList = <Streams>[].obs;

  void getStreams() async {
    var streamVariable = await RetrieveStreams.fetchStreams();
    streamList.value = streamVariable;
  }

  @override
  void onInit() {
    getStreams();
    super.onInit();
  }
}
