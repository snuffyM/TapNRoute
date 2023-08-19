import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tapnroute/src/constants/sizes.dart';
import 'package:tapnroute/src/constants/text_strings.dart';
import 'package:tapnroute/src/features/authentication/screens/forget_password/forget_password_otp/otp_screen.dart';

import '../../login/login_header_widget.dart';
import 'forget_header_widget.dart';

class ForgetPasswordMailScreen extends StatelessWidget {
  const ForgetPasswordMailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(tDefaultSize),
              child: Column(
                children: [
                  SizedBox(height: tDefaultSize * 4),
                  ForgetHeaderWidget(textAlign: TextAlign.center,),
                  SizedBox(height: tFormHeight),
                  Form(
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(
                            label: Text(tEmail),
                            hintText: tEmail,
                            prefixIcon: Icon(Icons.mail_outline_rounded),
                          ),
                        ),
                        const SizedBox(height:  20.0),
                        SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(onPressed: (){
                              Get.to(() => OTPScreen());
                            }, child: Text(tNext))),

                  ],),)

                ],
              ),
            ),
          ),
      ),
    );
  }
}
