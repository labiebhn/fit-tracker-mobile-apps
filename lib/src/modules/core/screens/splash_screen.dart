import 'package:fit_tracker_apps/src/utils/fonts.dart';
import 'package:fit_tracker_apps/src/utils/palettes.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
  }
}
