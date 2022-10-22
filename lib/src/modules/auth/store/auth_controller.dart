import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_tracker_apps/src/utils/enum.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  final storage = GetStorage();
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  Rx<Loading> loadingSignIn = Rx<Loading>(Loading.idle);
  RxString messageSignIn = ''.obs;
  Rx<Loading> loadingSignUp = Rx<Loading>(Loading.idle);
  RxString messageSignUp = ''.obs;

  @override
  void onInit() async {
    super.onInit();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {});
  }

  void signIn() async {
    try {
      loadingSignIn.value = Loading.pending;
      final result = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
      storage.write('userId', result.user?.uid);
      storage.write('auth', true);
      Get.snackbar(
        'Login Success',
        'Welcome back!',
      );
      loadingSignIn.value = Loading.success;
    } on FirebaseAuthException catch (e) {
      messageSignIn.value = e.message!;
      loadingSignIn.value = Loading.failed;
    } catch (e) {
      messageSignIn.value = 'Oops! Something went wrong.';
      loadingSignIn.value = Loading.failed;
    }
  }

  void signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      final UserCredential result =
          await FirebaseAuth.instance.signInWithCredential(credential);
      storage.write('userId', result.user?.uid);
      storage.write('auth', true);
      Get.snackbar(
        'Login Success',
        'Welcome back!',
      );
    } on FirebaseAuthException catch (e) {
      messageSignIn.value = e.message!;
      loadingSignIn.value = Loading.failed;
    } catch (error) {
      messageSignIn.value = 'Oops! Something went wrong.';
      loadingSignIn.value = Loading.failed;
    }
  }
}
