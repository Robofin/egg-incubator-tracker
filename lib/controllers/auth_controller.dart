import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../main_wrapper.dart';
import '../models/profile_model.dart';
import '../utils/firebase_auth_constants.dart';
import '../utils/helper_firestore_db.dart';
import '../views/login_page.dart';

class AuthController extends GetxController {
  static AuthController authInstance = Get.find();
  late Rx<User?> firebaseUser;

  @override
  void onReady() {
    super.onReady();
    firebaseUser = Rx<User?>(auth.currentUser);
    firebaseUser.bindStream(auth.userChanges());

    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    if (user != null) {
      // user is logged in
      Get.offAll(() => MainWrapper());
    } else {
      // user is null as in user is not available or not logged in
      Get.offAll(() => const LoginPage());
    }
  }

  void register(String fname, String lname, String email, String password,
      String phone, String about) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);

      final profileModel = ProfileModel(
        firstName: fname,
        lastName: lname,
        email: email,
        phone: phone,
        about: about,
      );
      await FirestoreDb.addProfile(profileModel);
    } on FirebaseAuthException catch (e) {
      // this is solely for the Firebase Auth Exception
      // for example : password did not match
      if (kDebugMode) {
        print(e.message);
      }
      // Get.snackbar("Error", e.message!);
      Get.snackbar(
        "Error",
        e.message!,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      // this is temporary. you can handle different kinds of activities
      //such as dialogue to indicate what's wrong
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  void login(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      // this is solely for the Firebase Auth Exception
      // for example : password did not match
      if (kDebugMode) {
        print(e.message);
      }
      Get.snackbar(
        "Error",
        e.message!,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  void resetPassword(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  void signOut() {
    try {
      auth.signOut();
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }
}
