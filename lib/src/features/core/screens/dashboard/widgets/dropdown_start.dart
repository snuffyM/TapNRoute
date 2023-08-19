import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../constants/sizes.dart';
import '../../../controllers/dashboard_controller.dart';
import '../../../controllers/profile_controller.dart';

class DropDownStart extends StatefulWidget {
  const DropDownStart({Key? key}) : super(key: key);

  @override
  _DropDownStartState createState() => _DropDownStartState();
}

class _DropDownStartState extends State<DropDownStart> {
  _DropDownStartState() {
    startLocation = _startlocation[0];
  }

  final _startlocation = ["Bengaluru", "Mysore", "Mangalore"];
  String? startLocation = "";

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DashBoardController());
    final formKey = GlobalKey<FormState>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      key: formKey,
      children: [
        DropdownButtonFormField(
          value: startLocation,
          items: _startlocation
              .map((e) => DropdownMenuItem(
                    child: Text(e),
                    value: e,
                  ))
              .toList(),
          onChanged: (String? val) {
            //setState(() {startLocation = val;});
            controller.startLocation.text = val!;
          },
          icon: const Icon(
            Icons.arrow_drop_down_circle,
            color: Colors.deepPurpleAccent,
          ),
          decoration: const InputDecoration(
            labelText: "Start Location",
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
