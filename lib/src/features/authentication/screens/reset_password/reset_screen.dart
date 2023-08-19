import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/text_strings.dart';
import '../login/login_screen.dart';
import '../signup/exception/checkphone.dart';

class ResetScreen extends StatefulWidget {
  const ResetScreen({Key? key}) : super(key: key);

  @override
  _ResetScreenState createState() => _ResetScreenState();
}

class _ResetScreenState extends State<ResetScreen> {
  final _formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final passwordRegex =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$&*~]).{8,}$');

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 80.0),

            const SizedBox(
                width: 200.0,
                height: 200.0,
                child: Image(
                  image: AssetImage("assets/images/reset.png"),
                  //height: size.height * 0.2,
                )),
            const SizedBox(height: 20.0),

            const Text("Reset Password",
                style: TextStyle(fontFamily: 'montserrat', fontSize: 20,fontWeight: FontWeight.bold)),
            const SizedBox(height: 50.0),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: passwordController,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.fingerprint),
                        labelText: tPassword,
                        hintText: tPassword,
                        border: OutlineInputBorder(),
                      ),
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
                    const SizedBox(height: 50.0),
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          final doc = FirebaseFirestore.instance
                              .collection('Users')
                              .doc(phone_uid);
                          try {
                            await doc
                                .update({'Password': passwordController.text});
                            Get.snackbar("Password Reset Successful", "Login");
                            Get.to(LoginScreen());
                          } catch (e) {
                            Get.snackbar("Error", e.toString());
                          }
                        }
                      },
                      child: const Text('Reset Password'),
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurpleAccent),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
