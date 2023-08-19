import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../constants/sizes.dart';
import '../../../controllers/dashboard_controller.dart';
import 'dashboard.dart';

class DatePick extends StatefulWidget {
  const DatePick({Key? key}) : super(key: key);

  @override
  _DatePickState createState() => _DatePickState();
}

class _DatePickState extends State<DatePick> {
  final controller = Get.put(DashBoardController());
  DateTime date = DateTime.now();

  void _showDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2023),
            lastDate: DateTime(2026))
        .then((value) {
      if (value != null) {
        setState(() {date = value!;});
        controller.date.text = value.toString().split(' ')[0];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    //final controller = Get.put(DashBoardController());
    final formKey = GlobalKey<FormState>();

    return Column(
      key: formKey,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: tFormHeight - 20),
        Text(date.toString().split(' ')[0],
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center),
        MaterialButton(
          onPressed: _showDatePicker,
          color: Colors.deepPurpleAccent,
          child: const Padding(
            padding: EdgeInsets.all(15.0),
            child: Text('Choose Date',
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
