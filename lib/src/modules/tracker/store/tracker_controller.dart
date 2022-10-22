import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fit_tracker_apps/src/utils/enum.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class TrackerController extends GetxController {
  final storage = GetStorage();
  Loading loadingList = Loading.idle;
  String messageList = '';
  List<Map> dataList = [];

  @override
  void onInit() {
    super.onInit();
    getUserWeights();
  }

  void getUserWeights() async {
    try {
      loadingList = Loading.pending;
      CollectionReference userWeights =
          FirebaseFirestore.instance.collection('userWeights');
      final userId = storage.read('userId');
      final result = await userWeights.doc(userId).get();
      // Map<String, dynamic> data = result.data() as Map<String, dynamic>;
      loadingList = Loading.success;
      update();
    } catch (error) {
      print(error);
      messageList = 'Oops! Something went wrong.';
      loadingList = Loading.failed;
      update();
    }
  }
}
