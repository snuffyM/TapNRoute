import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:tapnroute/src/constants/colors.dart';
import 'package:tapnroute/src/constants/images_strings.dart';
import 'package:tapnroute/src/constants/sizes.dart';
import 'package:tapnroute/src/constants/text_strings.dart';
import 'package:tapnroute/src/features/authentication/screens/welcome/welcome_screen.dart';
import 'package:tapnroute/src/features/core/screens/profile/information.dart';
import 'package:tapnroute/src/features/core/screens/profile/update_profile_screen.dart';
import 'package:tapnroute/src/features/core/screens/profile/widgets/history.dart';
import 'package:tapnroute/src/features/core/screens/profile/widgets/profile_menu.dart';
import 'package:tapnroute/src/features/core/screens/profile/widgets/travel.dart';
import 'package:tapnroute/src/repository/authentication_repository/exceptions/authentication_repository.dart';

import '../../../../repository/user_repository/fetch_id.dart';
import '../dashboard/widgets/dashboard.dart';
import 'help_and_support.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);

  var currentID = fetchID();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Get.to(() => Dashboard());
            },
            icon: const Icon(LineAwesomeIcons.angle_left)),
        title: Text(tProfile,
            style: TextStyle(fontFamily: 'montserrat', fontSize: 20, fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDefaultSize),
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: 280.0,
                    height: 280.0,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image(
                          image: AssetImage(tProfileImage),
                        )),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const SizedBox(height: 30.0),
              const Divider(),
              const SizedBox(height: 10.0),
              ProfileMenuWidget(
                  title: "History",
                  icon: LineAwesomeIcons.history,
                  onPress: () {
                    Get.to(() => travelScreen());
                  }),
              ProfileMenuWidget(
                  title: "Help and Support",
                  icon: LineAwesomeIcons.tools,
                  onPress: () {
                    Get.to(() => HelpAndSupport());
                  }),
              ProfileMenuWidget(
                  title: "Information",
                  icon: LineAwesomeIcons.info,
                  onPress: () {
                    Get.to(() => Information());
                  }),
              ProfileMenuWidget(
                  title: "Logout",
                  icon: LineAwesomeIcons.alternate_sign_out,
                  textColor: Colors.red,
                  endIcon: false,
                  onPress: () async {
                    await _auth.signOut();
                    Get.to(() => WelcomeScreen());
                    //AuthenticationRepository.instance.logout();
                    //print(AuthenticationRepository.instance.logout());
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
