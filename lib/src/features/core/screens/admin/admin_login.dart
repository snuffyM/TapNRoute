import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tapnroute/src/constants/sizes.dart';
import 'package:tapnroute/src/features/core/controllers/admin_controller.dart';

import 'admin_form.dart';

class AdminLogin extends StatelessWidget {
  const AdminLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
              child: Container(
        padding: const EdgeInsets.all(tDefaultSize),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50.0),
            Image(
              image: AssetImage("assets/images/admin_login.png"),
              height: size.height * 0.25,
            ),
            const SizedBox(height: 20.0),
            const Text("Admin Page",
                style: TextStyle(
                    fontFamily: 'montserrat',
                    fontSize: 30,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 20.0),
            AdminForm(),
          ],
        ),
      ))),
    );
  }
}


