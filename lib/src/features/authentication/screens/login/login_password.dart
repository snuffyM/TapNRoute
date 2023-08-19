import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../constants/sizes.dart';
import '../../../../constants/text_strings.dart';
import '../../controllers/login_controller.dart';

class LoginPass extends StatefulWidget {
  const LoginPass({Key? key}) : super(key: key);

  @override
  State<LoginPass> createState() => _LoginPassState();
}

class _LoginPassState extends State<LoginPass> {
  @override
  final controller = Get.put(LoginController());
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = false;

  Widget build(BuildContext context) {
    return
        TextFormField(
          key: _formKey,
          controller: controller.password,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.fingerprint_rounded),
            labelText: tPassword,
            hintText: tPassword,
            suffixIcon: GestureDetector(
              onTap: (){
                setState(() {
                  _obscureText =! _obscureText;
                });
              },
            )
          ),
        );
  }
}
