import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tapnroute/src/features/authentication/screens/forget_password/forget_password_mail/forget_password_mail.dart';

import '../../../../../constants/images_strings.dart';
import '../../../../../constants/sizes.dart';
import '../../../../../constants/text_strings.dart';
import '../../reset_password/phone_reset_password.dart';
import '../forget_password_phone/forget_password_phone.dart';
import 'forget_password_btn_widget.dart';

class ForgetPasswordScreen {
  static Future<dynamic> buildShowModalBottomSheet(BuildContext context) {
    //final size = MediaQuery.of(context).size;

    return showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      builder: (context) => Container(
          padding: EdgeInsets.all(tDefaultSize),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(tForgetPasswordTitle,
                  style: TextStyle(
                      fontFamily: 'montserrat',
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              Text(tForgetPasswordSubTitle,
                  style: TextStyle(fontFamily: 'montserrat', fontSize: 15)),
              const SizedBox(height: 30.0),
              ForgetPasswordBtnWidget(
                btnIcon: Icons.mobile_friendly_rounded,
                title: tPhoneNo,
                subTitle: tResetViaPhone,
                onTap: () {
                  Navigator.pop(context);
                  Get.to(() => const ForgetPasswordPhoneScreen());
                },
              ),
              const Image(
                alignment: Alignment.center,
                image: AssetImage(tResetPassword),
                width: 200,
                height: 200,
              ),
            ],
          )),
    );
  }
}
