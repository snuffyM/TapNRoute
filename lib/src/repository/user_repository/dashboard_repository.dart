import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tapnroute/src/features/core/models/apply_model.dart';

import 'fetch_id.dart';

class DashBoardRepository extends GetxController {
  static DashBoardRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<void> createApply(ApplyModel apply) async {
    var currentID = await fetchID();
    await _db
        .collection('Users')
        .doc(currentID)
        .collection('Travel_History')
        .add(apply.toJson())
        .whenComplete(
          () {
                Get.snackbar("Success", "Submitted your request",
                //snackPosition: SnackPosition.BOTTOM,
                backgroundColor: Colors.green,
                colorText: Colors.white,
                );
          })
        .catchError((error, stackTrace) {
      Get.snackbar("Error", "Try again",
          //snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent,
          colorText: Colors.white);
    });
  }
  
  Future<List<ApplyModel>>travel_History() async {
    var currentID = await fetchID();
    final snapshot = await _db.collection("Users").doc(currentID).collection("Travel_History").get();
    final userData = snapshot.docs.map((e) => ApplyModel.fromSnapshot(e)).toList();
    return userData;
  }
}
