import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tapnroute/src/features/core/screens/dashboard/widgets/dashboard.dart';
import 'package:tapnroute/src/repository/authentication_repository/exceptions/authentication_repository.dart';

class AdminController extends GetxController{
  static AdminController get instance => Get.find();

  final adminID = TextEditingController();
  final password = TextEditingController();

  void adminUser(String adminID, String password) {
    AuthenticationRepository.instance.adminCredential(adminID, password);
  }
}