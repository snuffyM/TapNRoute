import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tapnroute/src/constants/colors.dart';
import 'package:tapnroute/src/constants/images_strings.dart';
import 'package:tapnroute/src/constants/sizes.dart';
import 'package:tapnroute/src/constants/text_strings.dart';

import '../login/login_screen.dart';
import '../signup/signup_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(tDefaultSize),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(image: AssetImage(tWelcomeScreenImage), height: height * 0.6),
            Column(
              children: [
                Text(tWelcomeTitle, style: TextStyle(fontFamily:'Lilita One', fontSize: 30,fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                Text(tWelcomeSubTitle,  style: TextStyle(fontFamily:'Chakra Petch', fontSize: 25), textAlign: TextAlign.center,)
              ],
            ),
            Row(
              children: [
                Expanded(child: OutlinedButton(onPressed: () => Get.to(() => const LoginScreen()), style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(),
                  foregroundColor: tSecondaryColor,
                  side: BorderSide(color: tSecondaryColor),
                  padding: EdgeInsets.symmetric(vertical: tButtonHeight),
                ),child: Text(tLogin.toUpperCase()))),
                const SizedBox(width: 10.0),
                Expanded(child: ElevatedButton(onPressed: () => Get.to(() => const SignUpScreen()),style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(),
                    foregroundColor: tWhiteColor,
                    backgroundColor: tSecondaryColor,
                    side: BorderSide(color: tSecondaryColor),
                    padding: EdgeInsets.symmetric(vertical: tButtonHeight),
                  ),child: Text(tSignup.toUpperCase()))),
              ],
            )
          ],
        )
      )
    );
  }
}
