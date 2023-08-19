import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:logger/logger.dart';
import 'package:tapnroute/src/features/authentication/screens/forget_password/forget_password_options/forget_password_model_bottom_sheet.dart';
import 'package:tapnroute/src/features/authentication/screens/login/login_password.dart';

import '../../../../constants/sizes.dart';
import '../../../../constants/text_strings.dart';
import '../../../core/screens/dashboard/widgets/dashboard.dart';
import '../../controllers/login_controller.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    final _formKey = GlobalKey<FormState>();
    final firestoreInstance = FirebaseFirestore.instance;
    bool obscureText = false;

    return Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: tFormHeight - 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: controller.email,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person_outline_outlined),
                    labelText: tEmail,
                    hintText: tEmail,
                    border: OutlineInputBorder()),
                validator: (email) {
                  if (email == null || email.isEmpty) {
                    return 'Enter Email';
                  }
                  return null;
                },
              ),

              const SizedBox(height: tFormHeight - 20),

              TextFormField(
                controller: controller.password,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.fingerprint),
                  labelText: tPassword,
                  hintText: tPassword,
                  border: OutlineInputBorder(),
                  /*suffixIcon: IconButton(
                    onPressed: null,
                    icon: Icon(Icons.remove_red_eye_sharp),
                  ),*/
                ),
                obscureText: true,
                validator: (password) {
                  if (password == null || password.isEmpty) {
                    return 'Enter Password';
                  }
                  return null;
                },
              ),
              //LoginPass(),

              const SizedBox(height: tFormHeight - 20),

              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                    onPressed: () {
                      ForgetPasswordScreen.buildShowModalBottomSheet(context);
                    },
                    child: Text((tForgetPassword),
                        style: TextStyle(color: Colors.deepPurpleAccent))),
              ),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      LoginController.instance.loginUser(
                          controller.email.text.trim(),
                          controller.password.text.trim());
                      QuerySnapshot querySnapshot =
                          await firestoreInstance.collection('Users').get();
                      querySnapshot.docs.contains(controller.email.text.trim());
                    }
                  },
                  //},
                  child: Text(tLogin.toUpperCase()),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurpleAccent),
                ),
              ),
            ],
          ),
        ));
  }
}
