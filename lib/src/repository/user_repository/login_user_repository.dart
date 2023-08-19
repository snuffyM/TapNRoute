import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:tapnroute/src/features/authentication/models/user_model.dart';

// created to perform database operations

class LoginUserRepository extends GetxController {
  static LoginUserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  getUser(UserModel user) async {
    await _db.collection("Users").add(user.toJson()).whenComplete(()
    {
      //await _db.collection("Users").add(user as Map<String, dynamic>).whenComplete(() {
      Get.snackbar(
        "Success",
        "Your Account has been created",
        //snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }).catchError((error, stackTrace) {
      Get.snackbar("Error", "Something went wrong. Try again",
          //snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent,
          colorText: Colors.white);
      print("Error - $error");
    });
  }
}
