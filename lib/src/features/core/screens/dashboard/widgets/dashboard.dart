import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tapnroute/src/constants/colors.dart';
import 'package:tapnroute/src/constants/sizes.dart';
import 'package:tapnroute/src/features/core/screens/dashboard/widgets/timepick.dart';

import '../../../../../constants/images_strings.dart';
import '../../../../../constants/text_strings.dart';
import '../../../controllers/dashboard_controller.dart';
import '../../../models/apply_model.dart';
import '../../profile/profile_screen.dart';
import 'datepick.dart';
import 'dropdown_end.dart';
import 'dropdown_start.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //for styling the headings and title he created a variable called txtTheme
    //txtTheme = style: TextStyle(fontFamily: 'montserrat', fontSize: 20)
    final controller = Get.put(DashBoardController());
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        //leading: const Icon(Icons.menu, color: Colors.black87),
        title: const Text(tAppName,
            style: TextStyle(
                fontFamily: 'Lilita One', fontSize: 20, color: Colors.black87, fontWeight: FontWeight.bold)),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 20, top: 7),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: tCardBgColor),
            child: IconButton(
                onPressed: () {
                 Get.to(() =>ProfileScreen());
                },
                icon: const Image(image: AssetImage(tUserProfileImage))),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDashboardPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(tDashboardTitle,
                  style: TextStyle(
                      fontFamily: 'montserrat',
                      fontSize: 30,
                      fontWeight: FontWeight.bold)),
              const Text(tDashboardHeading,
                  style: TextStyle(fontFamily: 'montserrat', fontSize: 20)),
              const Image(image: AssetImage(tBannerImage)),
              Form(
                key: formKey,
                  child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //two drop down menus
                    DropDownStart(),
                    DropDownEnd(),
                    // date and time feature
                    DatePick(),
                    TimePick(),
                    //getting passenger count
                    const SizedBox(height: tFormHeight -10),
                    TextFormField(
                      controller: controller.pCount,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.person_outline_outlined),
                          labelText: tDashboardBannerTitle4,
                          labelStyle:
                              TextStyle(fontSize: 15, color: Colors.black),
                          border: OutlineInputBorder()),
                      validator: (pCount) {
                        if (pCount == null || pCount.isEmpty) {
                          return 'Enter Passenger count';
                        }
                        return null;
                      },
                    ),
                    //const SizedBox(height: tFormHeight -10),
                  ],
                ),
              )),

              //apply button
              const SizedBox(width: tDashboardPadding),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        if(formKey.currentState!.validate()){

                          if (controller.startLocation.text.trim().isEmpty ||
                              controller.endLocation.text.trim().isEmpty ||
                              controller.date.text.trim().isEmpty ||
                              controller.time.text.trim().isEmpty ||
                              controller.pCount.text.trim().isEmpty) {
                            Get.snackbar('Error', 'Please fill all the Fields to Submit', backgroundColor: Colors.red, colorText: Colors.white);
                            return;
                          }

                          if (controller.startLocation.text.trim() ==
                              controller.endLocation.text.trim()) {
                            Get.snackbar(
                              "Error",
                              "Please select different locations", backgroundColor: Colors.red, colorText: Colors.white
                            );
                            return;
                          }
                          final apply = ApplyModel(
                            startLocation: controller.startLocation.text.trim(),
                            endLocation: controller.endLocation.text.trim(),
                            date: controller.date.text.trim(),
                            time: controller.time.text.trim(),
                            pCount: controller.pCount.text.trim(),
                          );
                          DashBoardController.instance.createApply(apply);
                        }
                        //Get.to(()=> DashBoardRepository());
                      },
                      child: const Text(tDashboardButton), style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurpleAccent),)),
            ],
          ),
        ),
      ),
    );
  }
}
