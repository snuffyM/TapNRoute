import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../constants/sizes.dart';
import '../../../controllers/admin_dashboard_controller.dart';
import '../../../controllers/dashboard_controller.dart';

class AdminDropDownEnd extends StatefulWidget {
  const AdminDropDownEnd({Key? key}) : super(key: key);

  @override
  _AdminDropDownEndState createState() => _AdminDropDownEndState();
}

class _AdminDropDownEndState extends State<AdminDropDownEnd> {
  _AdminDropDownEndState() {
    endLocation = _endlocation[0];
  }

  final _endlocation = ["Mysore", "Bengaluru", "Mangalore"];
  String? endLocation = "";

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AdminDashboardController());
    final formKey = GlobalKey<FormState>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      key: formKey,
      children: [
        const SizedBox(height: tFormHeight - 20),
        DropdownButtonFormField(
          value: endLocation,
          items: _endlocation
              .map((e) => DropdownMenuItem(
            child: Text(e),
            value: e,
          ))
              .toList(),
          onChanged: (val) {
            //setState(() {endLocation = val as String;});
            controller.endLocation.text = val!;
          },
          icon: const Icon(
            Icons.arrow_drop_down_circle,
            color: Colors.deepPurpleAccent,
          ),
          decoration: const InputDecoration(
              labelText: "Destination",
              prefixIcon: Icon(
                Icons.location_city_rounded, color: Colors.deepPurpleAccent,
              ),
              labelStyle: TextStyle(fontSize: 20, color: Colors.black87, fontWeight: FontWeight.bold),
              border: OutlineInputBorder()
          ),
        )
      ],
    );
  }
}
