import 'package:fit_tracker_apps/src/modules/core/store/core_controller.dart';
import 'package:fit_tracker_apps/src/utils/fonts.dart';
import 'package:fit_tracker_apps/src/utils/palettes.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CoreController>(
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child: Center(
              child: Text(
                'Fit Tracker Apps',
                style: Fonts.h4.merge(TextStyle(color: Palettes.text)),
              ),
            ),
          ),
        );
      },
    );
  }
}
