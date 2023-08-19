import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tapnroute/src/features/core/screens/dashboard/widgets/dashboard.dart';
import 'package:tapnroute/src/repository/authentication_repository/exceptions/authentication_repository.dart';

import '../screens/login/login_screen.dart';

class OTPController extends GetxController{
  static OTPController get instance => Get.find();

  void verifyOTP(String otp) async{
    var isVerified = await AuthenticationRepository.instance.verifyOTP(otp);
    isVerified ? Get.offAll(const LoginScreen(), arguments: Get.snackbar("Account created Successfully", "Please Login", backgroundColor: Colors.green,
      colorText: Colors.white,)) : Get.back();
  }
}