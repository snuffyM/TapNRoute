import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:tapnroute/src/repository/authentication_repository/exceptions/authentication_repository.dart';

class PhoneOTPController extends GetxController{
  static PhoneOTPController get instance => Get.find();

  final phoneNo = TextEditingController();

  void phoneAuthentication(String phoneNo){
    AuthenticationRepository.instance.phoneAuthentication(phoneNo);
  }
}
