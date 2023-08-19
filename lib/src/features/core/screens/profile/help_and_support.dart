import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:tapnroute/src/constants/images_strings.dart';
import 'package:tapnroute/src/constants/text_strings.dart';
import 'package:tapnroute/src/features/core/screens/profile/profile_screen.dart';

import '../../../../constants/sizes.dart';

class HelpAndSupport extends StatelessWidget {
  const HelpAndSupport({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HELP and SUPPORT"),
        backgroundColor: Colors.deepPurple,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.to(() => ProfileScreen());
          },
          icon: const Icon(LineAwesomeIcons.angle_left),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(tDefaultSize),
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage(tHelpSupport)),
            Text(tHelpSupportTitle,
                style: TextStyle(
                    fontSize: 30.0,
                    fontFamily: 'RaleWay',
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 30.0),
            Text("Contact",
                style: TextStyle(fontSize: 20.0, fontFamily: 'montserrat')),
            const SizedBox(height: 20.0),
            Text("Email: tapNroute@gmail.com",
                style: TextStyle(fontSize: 15.0, fontFamily: 'montserrat')),
            Text("Contact_number: +91 9888888888",
                style: TextStyle(fontSize: 15.0, fontFamily: 'montserrat')),
            Text("Alternate Contact_number : +91 9999999999",
                style: TextStyle(fontSize: 15.0, fontFamily: 'montserrat')),
          ],
        ),
      ),
    );
  }
}
