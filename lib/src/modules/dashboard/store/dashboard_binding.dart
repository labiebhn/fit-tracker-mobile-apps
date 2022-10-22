import 'package:fit_tracker_apps/src/modules/profile/store/profile_controller.dart';
import 'package:fit_tracker_apps/src/modules/tracker/store/tracker_controller.dart';
import 'package:get/get.dart';

import 'dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() => DashboardController());
    Get.lazyPut<TrackerController>(() => TrackerController());
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}
