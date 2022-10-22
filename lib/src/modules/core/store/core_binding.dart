import 'package:fit_tracker_apps/src/modules/core/store/core_controller.dart';
import 'package:get/instance_manager.dart';

class CoreBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CoreController());
  }
}
