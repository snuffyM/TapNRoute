import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:tapnroute/src/features/authentication/models/user_model.dart';

// created to perform database operations

class UserRepository extends GetxController{
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  createUser(UserModel user) async {
    await _db.collection("Users").add(user.toJson()).whenComplete(() {
    //await _db.collection("Users").add(user as Map<String, dynamic>).whenComplete(() {
      Get.snackbar(
          "Success",
          "Your Account has been created",
            //snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green.withOpacity(0.1),
            colorText: Colors.green,
        );
    }).catchError((error, stackTrace) {
      Get.snackbar("Error", "Something went wrong. Try again",
      //snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.redAccent.withOpacity(0.1),
      colorText: Colors.red);
      print("Error - $error");
    });
  }

  Future<UserModel> getUserDetails(String phoneNo) async {
    print("PHONE:"+ phoneNo);
    final snapshot = await _db.collection("Users").where("Phone_Number", isEqualTo: phoneNo).get();
    final userData = snapshot.docs.map((e) => UserModel.fromSnapShot(e)).single;
    print("inside user repository snapshot"+snapshot.toString());
    print("inside user repository user data"+userData.toString());

    return userData;
  }

  Future<List<UserModel>> allUser() async {
    final snapshot = await _db.collection("Users").get();
    final userData = snapshot.docs.map((e) => UserModel.fromSnapShot(e)).toList();
    return userData;
  }
}