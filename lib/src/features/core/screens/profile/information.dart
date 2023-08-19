import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:tapnroute/main.dart';
import 'package:tapnroute/src/constants/sizes.dart';
import 'package:tapnroute/src/constants/text_strings.dart';
import 'package:tapnroute/src/features/core/screens/profile/profile_screen.dart';

import '../../../../constants/images_strings.dart';

class Information extends StatelessWidget {
  const Information({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("INFORMATION"),
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
          children: const [
            Image(image: AssetImage(tInformation)),
            Text(tInformationTitle, style: TextStyle(fontSize:30.0, fontFamily: 'Raleway', fontWeight: FontWeight.bold )),

            SizedBox(height: 30.0),

            Text("The application is a user-friendly platform focusing on enhancing customer experience "
                "of traveling from start location to end location and administrating the available resources "
                "beneficially by conceding each individual to interact in a roundabout way with the organization,"
                , style: TextStyle(fontSize: 20.0, fontFamily: 'montserrat'), textAlign: TextAlign.justify),
          ],


        ),
      ),

    );
  }
}
