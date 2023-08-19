import 'package:get/get.dart';
import 'package:tapnroute/src/features/authentication/screens/login/login_screen.dart';
import 'package:tapnroute/src/features/authentication/screens/reset_password/reset_screen.dart';
import 'package:tapnroute/src/features/core/screens/dashboard/widgets/dashboard.dart';
import 'package:tapnroute/src/repository/authentication_repository/exceptions/authentication_repository.dart';

class ResetOTPController extends GetxController{
  static ResetOTPController get instance => Get.find();

  void ResetverifyOTP(String otp) async{
    var isVerified = await AuthenticationRepository.instance.verifyOTP(otp);
    isVerified ? Get.offAll(const ResetScreen()) : Get.back();
  }
}