import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tapnroute/src/features/authentication/controllers/signup_controller.dart';
import 'package:tapnroute/src/features/authentication/models/user_model.dart';
import 'package:tapnroute/src/features/authentication/screens/forget_password/forget_password_otp/otp_screen.dart';
import 'package:tapnroute/src/features/authentication/screens/login/login_screen.dart';
import 'package:tapnroute/src/features/authentication/screens/signup/exception/checkphone.dart';
import '../../../../../constants/colors.dart';
import '../../../../../constants/sizes.dart';
import '../../../../../constants/text_strings.dart';

class SignUpFormWidget extends StatelessWidget {
  const SignUpFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    final _formKey = GlobalKey<FormState>();
    bool obscureText = false;
    final passwordRegex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$&*~]).{8,}$');

    return Container(
        padding: EdgeInsets.symmetric(vertical: tFormHeight - 10),
        child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: controller.fullName,
                  decoration: const InputDecoration(
                      label: Text(tFullName),
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(
                        Icons.person_outline_rounded,
                        color: tSecondaryColor,
                      ),
                      labelStyle: TextStyle(color: tSecondaryColor),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2.0, color: tSecondaryColor))),
                  validator: (fullName) {
                    if (fullName == null || fullName.isEmpty) {
                      return 'Enter Full Name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: tFormHeight - 20),
                TextFormField(
                  controller: controller.email,
                  decoration: const InputDecoration(
                      label: Text(tEmail),
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color: tSecondaryColor,
                      ),
                      labelStyle: TextStyle(color: tSecondaryColor),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2.0, color: tSecondaryColor))),
                  validator: (email) {
                    if (email == null || email.isEmpty) {
                      return 'Enter Email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: tFormHeight - 20),
                TextFormField(
                  controller: controller.phoneNo,
                  decoration: const InputDecoration(
                      label: Text(tPhoneNo),
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(
                        Icons.numbers_outlined,
                        color: tSecondaryColor,
                      ),
                      labelStyle: TextStyle(color: tSecondaryColor),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 2.0, color: tSecondaryColor),
                      )),
                  validator: (phoneNo) {
                    if (phoneNo == null || phoneNo.isEmpty) {
                      return 'Enter Phone number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: tFormHeight - 20),
                TextFormField(
                  controller: controller.password,
                  decoration: const InputDecoration(
                      label: Text(tPassword),
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(
                        Icons.fingerprint_outlined,
                        color: tSecondaryColor,
                      ),
                      labelStyle: TextStyle(color: tSecondaryColor),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2.0, color: tSecondaryColor))),
                  obscureText: true,
                  validator: (password) {
                    if (password == null || password.isEmpty) {
                      return 'Enter Password';
                    }
                    if (!passwordRegex.hasMatch(password!)) {
                      return 'Enter a password with minimum of 8 characters containing: \n 1 upper case, 1 lower case, 1 digit and a special character';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: tFormHeight - 10),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        //the below code is for email and password authentication
                        // SignUpController.instance.registerUser(controller.email.text.trim(), controller.password.text.trim());
                        final phoneAlreadyexists = await checkIfPhoneExists(
                            controller.phoneNo.text.trim());
                        if (phoneAlreadyexists != null) {
                          Get.snackbar(
                              'User Already Exists', 'Please try again',
                              backgroundColor: Colors.red,
                              colorText: Colors.white);
                        } else {
                          final user = UserModel(
                            email: controller.email.text.trim(),
                            password: controller.password.text.trim(),
                            fullName: controller.fullName.text.trim(),
                            phoneNo: controller.phoneNo.text.trim(),
                          );
                          SignUpController.instance.createUser(user);
                        }
                      }
                    },
                    child: Text(tSignup.toUpperCase()),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurpleAccent),
                  ),
                )
              ],
            )));
  }
}
