import 'package:fit_tracker_apps/src/routes/app_pages.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';

class CoreController extends GetxController {
  final storage = GetStorage();

  @override
  void onInit() async {
    super.onInit();
    await Future.delayed(Duration.zero);
    _navigateOnAuth();
  }

  void _navigateOnAuth() {
    final auth = storage.read('auth');
    if (auth == true) {
      Get.offAndToNamed(Routes.DASHBOARD);
    } else {
      Get.offAndToNamed(Routes.LOGIN);
    }
  }
}
