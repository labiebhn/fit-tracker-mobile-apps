import 'package:fit_tracker_apps/src/modules/auth/screens/login_screen.dart';
import 'package:fit_tracker_apps/src/modules/auth/store/auth_binding.dart';
import 'package:fit_tracker_apps/src/modules/core/screens/splash_screen.dart';
import 'package:fit_tracker_apps/src/modules/core/store/core_binding.dart';
import 'package:get/route_manager.dart';
part './app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.INITIAL,
      page: () => SplashScreen(),
      binding: CoreBinding(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginScreen(),
      binding: AuthBinding(),
    ),
  ];
}
