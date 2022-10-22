import 'package:fit_tracker_apps/src/modules/auth/store/auth_controller.dart';
import 'package:fit_tracker_apps/src/utils/enum.dart';
import 'package:fit_tracker_apps/src/utils/palettes.dart';
import 'package:fit_tracker_apps/src/widgets/forms/input_text_main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<AuthController>(builder: (controller) {
      return Scaffold(
        body: SafeArea(
          child: Container(
            width: double.infinity,
            color: Palettes.background,
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InputTextMain(
                  controller: controller.email,
                  label: 'Email',
                ),
                InputTextMain(
                  controller: controller.password,
                  label: 'Password',
                  type: InputTextMainType.PASSWORD,
                ),
                controller.loadingSignIn.value == Loading.failed
                    ? Text(controller.messageSignIn.value)
                    : Container(),
                Container(height: 8),
                ElevatedButton(
                  child: Text(controller.loadingSignIn.value == Loading.pending
                      ? 'Loading..'
                      : 'Sign in'),
                  onPressed: () => controller.signIn(),
                ),
                Container(height: 36),
                SignInButton(
                  Buttons.Google,
                  text: "Sign up with Google",
                  onPressed: () => controller.signInWithGoogle(),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
