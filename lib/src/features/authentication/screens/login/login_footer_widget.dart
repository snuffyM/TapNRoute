import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../constants/images_strings.dart';
import '../../../../constants/sizes.dart';
import '../../../../constants/text_strings.dart';
import '../signup/signup_screen.dart';

class LoginFooterWidget extends StatelessWidget {
  const LoginFooterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: tFormHeight - 20,
        ),
        TextButton(
          onPressed: () {
            Get.to(() => SignUpScreen());
          },
          child: const Text.rich(
            TextSpan(
                text: tDontHaveAnAccount,
                style: TextStyle(
                    fontFamily: 'montserrat',
                    fontSize: 15,
                    color: Colors.black87),
                children: [
                  TextSpan(
                    text: tSignup,
                    style: TextStyle(color: Colors.deepPurpleAccent),
                  )
                ]),
          ),
        ),
      ],
    );
  }
}
