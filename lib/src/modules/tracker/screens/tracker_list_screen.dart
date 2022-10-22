import 'package:fit_tracker_apps/src/modules/tracker/store/tracker_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class TrackerListScreen extends GetView<TrackerController> {
  const TrackerListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Text('Tracker List'),
    );
  }
}
