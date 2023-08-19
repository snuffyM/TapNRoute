import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../constants/sizes.dart';
import '../../../controllers/dashboard_controller.dart';

class TimePick extends StatefulWidget {
  const TimePick({Key? key}) : super(key: key);

  @override
  _TimePickState createState() => _TimePickState();
}

class _TimePickState extends State<TimePick> {
  final controller = Get.put(DashBoardController());
  TimeOfDay time = TimeOfDay.now();

  void _showTimePicker() {
    showTimePicker(context: context, initialTime: TimeOfDay.now())
        .then((value) {
      if (value != null) {
        setState(() {time = value!;});
        controller.time.text = value.toString().split(' ')[0];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return Column(
      key: formKey,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: tFormHeight - 20),
        Text(time.format(context).toString(),
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center),
        MaterialButton(
          onPressed: _showTimePicker,
          color: Colors.deepPurpleAccent,
          child: const Padding(
            padding: EdgeInsets.all(15.0),
            child: Text('Pick Time',
                style: TextStyle(
                    fontFamily: 'montserrat',
                    fontSize: 15,
                    color: Colors.white)),
          ),
        )
      ],
    );
  }
}
