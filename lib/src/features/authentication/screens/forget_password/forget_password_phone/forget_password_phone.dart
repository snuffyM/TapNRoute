import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tapnroute/src/features/authentication/screens/reset_password/reset_otp.dart';

import '../../../../../constants/sizes.dart';
import '../../../../../constants/text_strings.dart';
import '../../../controllers/phone_otp_controller.dart';
import '../../signup/exception/checkphone.dart';
import '../forget_password_mail/forget_header_widget.dart';
import '../forget_password_otp/otp_screen.dart';

class ForgetPasswordPhoneScreen extends StatelessWidget {
  const ForgetPasswordPhoneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(PhoneOTPController());
    final _formKey = GlobalKey<FormState>();

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(
              children: [
                SizedBox(height: tDefaultSize * 4),
                const ForgetHeaderWidget(
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: tFormHeight),
                Form(
                  key: _formKey,
                  child: Column(
                    //key: _formKey,
                    children: [
                      TextFormField(
                        controller: controller.phoneNo,
                        decoration: const InputDecoration(
                          label: Text(tPhoneNo),
                          hintText: tPhoneNo,
                          prefixIcon: Icon(Icons.numbers_outlined),
                        ),

                      ),
                      const SizedBox(height: 20.0),
                      SizedBox(
                          width: double.infinity,
                          child: MaterialButton(
                              onPressed: () async {
                                if(_formKey.currentState!.validate()) {
                                  final phoneAlreadyexists = await checkIfPhoneExists(
                                      controller.phoneNo.text.trim());
                                  if (phoneAlreadyexists != null) {
                                    PhoneOTPController.instance
                                        .phoneAuthentication(
                                        controller.phoneNo.text.trim());
                                    //Get.to(() => const OTPScreen());
                                    Get.to(() => const ResetOTPScreen());
                                  }
                                  else{
                                    Get.snackbar("Error", "Enter Registered number", backgroundColor: Colors.red, colorText: Colors.white);
                                  }
                                }
                                //Get.to(() => const OTPScreen());
                              },

                              child: Text(tNext.toUpperCase()))),
                      const SizedBox(height: 30.0),
                      Text("Note: $tNote")
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
