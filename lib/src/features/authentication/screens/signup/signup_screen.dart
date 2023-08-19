import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tapnroute/src/common_widgets/form/form_header_widget.dart';
import 'package:tapnroute/src/constants/colors.dart';
import 'package:tapnroute/src/constants/images_strings.dart';
import 'package:tapnroute/src/constants/sizes.dart';
import 'package:tapnroute/src/constants/text_strings.dart';
import 'package:tapnroute/src/features/authentication/screens/login/login_footer_widget.dart';
import 'package:tapnroute/src/features/authentication/screens/login/login_form_widget.dart';
import 'package:tapnroute/src/features/authentication/screens/login/login_header_widget.dart';
import 'package:tapnroute/src/features/authentication/screens/login/login_screen.dart';
import 'package:tapnroute/src/features/authentication/screens/signup/widgets/signup_form_widget.dart';

import '../../../core/screens/dashboard/widgets/dashboard.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDefaultSize),
          child: Column(
            children: [
              const FormHeaderWidget(

                image: tWelcomeScreenImage,
                title: tSignUpTitle,
                subTitle: tSignUpSubTitle,
              ),
              const SignUpFormWidget(),
              Column(
                children: [
                  TextButton(
                      onPressed: () {
                        Get.to(() => LoginScreen());
                        },
                      child: Text.rich(TextSpan(children: [
                        const TextSpan(
                            text: tAlreadyHaveAnAccount,
                            style: TextStyle(
                                fontFamily: 'montserrat',
                                fontSize: 15,
                                color: Colors.black87)),
                        TextSpan(text: tLogin.toUpperCase(), style: TextStyle(color: Colors.deepPurpleAccent),),
                      ]))),
                  Text("NOTE: $tNote")
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
