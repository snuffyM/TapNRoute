import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tapnroute/src/constants/images_strings.dart';
import 'package:tapnroute/src/constants/sizes.dart';
import 'package:tapnroute/src/constants/text_strings.dart';
import 'package:tapnroute/src/features/core/screens/admin/admin_login.dart';

import '../../../../constants/colors.dart';
import '../../../core/screens/profile/profile_screen.dart';
import 'login_footer_widget.dart';
import 'login_form_widget.dart';
import 'login_header_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(tDefaultSize),
                child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 300, top: 7),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20), color: tCardBgColor),
                      child: IconButton(
                          onPressed: () {
                            Get.to(() =>AdminLogin());
                          },
                          icon: const Image(image: AssetImage(tAdminImage)), iconSize: 40),
                    ),
                    LoginHeaderWidget(),
                    LoginForm(),
                    LoginFooterWidget()
                  ],
                )
              ),
          ),
      ),
    );
  }
}






