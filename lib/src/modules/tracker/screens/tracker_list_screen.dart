import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fit_tracker_apps/src/modules/tracker/store/tracker_controller.dart';
import 'package:fit_tracker_apps/src/utils/enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';

class TrackerListScreen extends GetView<TrackerController> {
  const TrackerListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final storage = GetStorage();
    final userId = storage.read('userId');
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(userId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }
        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist");
        }
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          print('data: $data');
          return Text("Full Name: ${data['full_name']} ${data['last_name']}");
        }
        return Text("loading");
      },
    );
  }
}
