import 'package:elibrary/model/streams.dart';
import 'package:elibrary/services/streams/streams.dart';
import 'package:get/get.dart';

class StreamsController extends GetxController {
  RxList<Streams> streamList = <Streams>[].obs;

  @override
  void onInit() {
    // fetchStreams();
    super.onInit();
  }

  void fetchStreams() async {
    List<Streams> availableStreams = await RemoteServices.getStreams();

    streamList.value = availableStreams;
  }
}
