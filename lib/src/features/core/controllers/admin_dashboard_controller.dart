import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../repository/authentication_repository/exceptions/authentication_repository.dart';

class AdminDashboardController extends GetxController {
  static AdminDashboardController get instance => Get.find();

  final startLocation = TextEditingController();
  final endLocation = TextEditingController();
  final date = TextEditingController();

  void adminDashboardCtrl(String startLocation, String endLocation,
      String date) {
    AuthenticationRepository.instance.adminDash(
        startLocation, endLocation, date);
  }
}
