import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controllers/admin_controller.dart';

class AdminForm extends StatefulWidget {
  const AdminForm({
    super.key,
  });

  @override
  State<AdminForm> createState() => _AdminFormState();
}

class _AdminFormState extends State<AdminForm> {
  static final _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AdminController());
    //final _formKey = GlobalKey<FormState>();
    final firestoreInstance = FirebaseFirestore.instance;

    return Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: controller.adminID,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.admin_panel_settings_rounded),
                    labelText: "Admin ID",
                    hintText: "Admin ID",
                    border: OutlineInputBorder()),
                validator: (email) {
                  if (email == null || email.isEmpty) {
                    return 'Admin ID';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20.0),
              TextFormField(
                controller: controller.password,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.password_rounded),
                  labelText: "Password",
                  hintText: "Password",
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    onPressed: null,
                    icon: Icon(Icons.remove_red_eye_sharp),
                  ),
                ),
                obscureText: true,
                validator: (password) {
                  if (password == null || password.isEmpty) {
                    return 'Enter Password';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30.0),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      AdminController.instance.adminUser(
                          controller.adminID.text.trim(),
                          controller.password.text.trim());
                      QuerySnapshot querySnapshot =
                      await firestoreInstance.collection('Admin')
                          .get();
                      querySnapshot.docs.contains(
                          controller.adminID.text.trim()) && querySnapshot.docs.contains(controller.password.text.trim());
                    }
                  },
                  child: Text("LOGIN".toUpperCase()),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurpleAccent),
                ),
              )
            ],
          ),
        ));
  }
}