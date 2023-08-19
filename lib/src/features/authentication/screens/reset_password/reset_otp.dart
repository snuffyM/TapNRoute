import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tapnroute/src/constants/sizes.dart';
import 'package:tapnroute/src/constants/text_strings.dart';
import 'package:tapnroute/src/features/authentication/controllers/otp_controller.dart';
import 'package:tapnroute/src/features/authentication/screens/reset_password/reset_otp_controller.dart';

class ResetOTPScreen extends StatelessWidget {
  const ResetOTPScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var otpController = Get.put(ResetOTPController());
    var otp;

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(tDefaultSize),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              tOtpTitle,
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold,
                fontSize: 80.0,
              ),
            ),
            Text(tOtpSubTitle.toUpperCase(),
                style: const TextStyle(fontFamily: 'montserrat', fontSize: 30)),
            const SizedBox(
              height: 40.0,
            ),
            const Text(
              "$tOtpMessage your number",
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20.0,
            ),
            OtpTextField(
                mainAxisAlignment: MainAxisAlignment.center,
                numberOfFields: 6,
                fillColor: Colors.black87.withOpacity(0.1),
                filled: true,
                onSubmit: (code) {
                  otp = code;
                  ResetOTPController.instance.ResetverifyOTP(otp);
                } //=> print("OTP is => $code")
            ),
            const SizedBox(
              height: 20.0,
            ),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      ResetOTPController.instance.ResetverifyOTP(otp);
                    }, style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurpleAccent),
                    child: const Text(tNext)))
          ],
        ),
      ),
    );
  }
}
