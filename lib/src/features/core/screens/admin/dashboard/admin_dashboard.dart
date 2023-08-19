import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tapnroute/src/constants/colors.dart';
import 'package:tapnroute/src/features/core/controllers/admin_dashboard_controller.dart';
import 'package:tapnroute/src/features/core/screens/admin/dashboard/admin_display.dart';

import '../../../../../constants/sizes.dart';
import '../../../../authentication/screens/welcome/welcome_screen.dart';
import '../../../controllers/dashboard_controller.dart';
import 'admin_datepick.dart';
import 'admin_dd_end.dart';
import 'admin_dd_start.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final controller = Get.put(DashBoardController());
    final formKey = GlobalKey<FormState>();
    final controller = Get.put(AdminDashboardController());
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final firestoreInstance = FirebaseFirestore.instance;

    List<String> userIds = [];
    List<DocumentSnapshot> travelDocs = [];

    return Scaffold(
      appBar: AppBar(
        //leading: const Icon(Icons.menu, color: Colors.black87),
        title: const Text("Admin Dashboard",
            style: TextStyle(
                fontFamily: 'Lilita One',
                fontSize: 20,
                color: Colors.black87,
                fontWeight: FontWeight.bold)),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 20, top: 7),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.redAccent),
            child: IconButton(
              onPressed: () async {
                await _auth.signOut();
                Get.to(() => WelcomeScreen());
              },
              icon: const Text("LogOut",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 8,
                      fontFamily: 'montserrat')),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDashboardPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Image(image: AssetImage("assets/images/admin_dashboard.png")),
              const SizedBox(height: 20.0),
              Form(
                  key: formKey,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        //two drop down menus
                        AdminDropDownStart(),
                        //SizedBox(height: tFormHeight -10),
                        AdminDropDownEnd(),
                        SizedBox(height: tFormHeight - 10),
                        AdminDatePick(),
                        //const SizedBox(height: tFormHeight -10),
                      ],
                    ),
                  )),
              const SizedBox(width: tDashboardPadding),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        AdminDashboardController.instance.adminDashboardCtrl(
                            controller.startLocation.text.trim(),
                            controller.endLocation.text.trim(),
                            controller.date.text.trim());

                        QuerySnapshot userSnapshot =
                            await firestoreInstance.collection('Users').get();
                        for (var userDoc in userSnapshot.docs) {
                          String userId = userDoc.id;
                          CollectionReference travelHistoryRef =
                              firestoreInstance
                                  .collection('Users')
                                  .doc(userId)
                                  .collection('Travel_History');
                          QuerySnapshot travelHistorySnapshot =
                              await travelHistoryRef
                                  .where('Date', isEqualTo: controller.date.text.trim())
                                  .where('StartLocation', isEqualTo: controller.startLocation.text.trim())
                                  .where('EndLocation', isEqualTo: controller.endLocation.text.trim())
                                  .get();
                          if (travelHistorySnapshot.docs.isNotEmpty) {
                            print('User ID: $userId');
                            for (var travelDoc in travelHistorySnapshot.docs) {
                              print(travelDoc.data());
                              userIds.add(userId);
                              travelDocs.add(travelDoc);
                            }
                          }
                          //Get.to(DisplayResults(userIds: userId, travelDocs: travelDoc));
                        }
                        Get.to(() => DisplayResults(userIds: userIds, travelDocs: travelDocs));
                      }
                    },
                    child: const Text("Search"),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurpleAccent),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
