import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:tapnroute/src/constants/colors.dart';
import 'package:tapnroute/src/constants/images_strings.dart';
import 'package:tapnroute/src/constants/sizes.dart';
import 'package:tapnroute/src/constants/text_strings.dart';
import 'package:tapnroute/src/features/authentication/models/user_model.dart';
import 'package:tapnroute/src/features/core/controllers/profile_controller.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () => Get.back(), icon: const Icon(LineAwesomeIcons.angle_left)),
        title: const Text(tEditProfile, style: TextStyle(fontFamily: 'montserrat', fontSize: 20)),
      ),

      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDefaultSize),
          child: FutureBuilder(
            future: controller.getUserData(),
            builder: (context, snapshot){
              print("inside update profile before snapshot connection");
              if(snapshot.connectionState == ConnectionState.done){
                print("inside update profile snapshot connection");
                if(snapshot.hasData){
                  UserModel userData = snapshot.data as UserModel;
                  print("inside updateprofile" + userData.toString());
                  return Column(
                    children: [
                      Stack(
                        children: [
                          SizedBox(
                            width: 120,
                            height: 120,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(100), child: const Image(image: AssetImage(tProfileImage))),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: tPrimaryColor),
                              //child: const Icon(
                                //LineAwesomeIcons.camera,
                                //color: Colors.black,
                                //size: 20.0,
                              //),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 50),
                      Form(child: Column(
                        children: [
                          TextFormField(
                            initialValue: userData.fullName,
                            decoration: const InputDecoration(label: Text(tFullName), prefixIcon: Icon(LineAwesomeIcons.user)),
                          ),
                          const SizedBox(height: tFormHeight -20),
                          TextFormField(
                            initialValue: userData.email,
                            decoration: const InputDecoration(label: Text(tEmail), prefixIcon: Icon(LineAwesomeIcons.envelope_1)),
                          ),
                          const SizedBox(height: tFormHeight -20),
                          TextFormField(
                            initialValue: userData.phoneNo,
                            decoration: const InputDecoration(label:  Text(tPhoneNo), prefixIcon: Icon(LineAwesomeIcons.phone)),
                          ),
                          const SizedBox(height: tFormHeight -20),
                          TextFormField(
                            initialValue: userData.password,
                            decoration: const InputDecoration(label: Text(tPassword), prefixIcon: Icon(Icons.fingerprint)),
                          ),
                          const SizedBox(height: tFormHeight),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () => Get.to(() => UpdateProfileScreen()),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: tPrimaryColor, side: BorderSide.none, shape: const StadiumBorder()),
                              child: const Text(tEditProfile, style: TextStyle(fontFamily: 'montserrat', fontSize: 20)),
                            ),
                          ),
                          const SizedBox(height: tFormHeight),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text.rich(
                                TextSpan(
                                  text: tJoined,
                                  style: TextStyle(fontSize: 18.0),
                                  children: [
                                    TextSpan(text: tJoinedAt, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20))
                                  ],
                                ),
                              ),
                              ElevatedButton(
                                onPressed: (){},
                                style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent.withOpacity(0.1),
                                    elevation: 0,
                                    foregroundColor: Colors.red,
                                    shape: const StadiumBorder(),
                                    side: BorderSide.none
                                ),
                                child: const Text(tDelete),
                              ),
                            ],
                          ),

                        ],
                      ))
                    ],
                  );
                }
                else if(snapshot.hasError){
                  return Center(child: Text(snapshot.error.toString()));
                }
                else{
                  return const Center(child: Text('Something went wrong'));
                }
              }else{
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }
}
