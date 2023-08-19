import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class DisplayResults extends StatelessWidget {
  const DisplayResults({
    Key? key,
    required this.userIds,
    required this.travelDocs,
  }) : super(key: key);

  final List<String> userIds;
  final List<DocumentSnapshot> travelDocs;

  @override
  Widget build(BuildContext context) {
    int totalPassengerCount = 0;
    for (var doc in travelDocs) {
      totalPassengerCount += int.parse(doc['Passenger_Count']);
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(LineAwesomeIcons.angle_left)),
        title: const Text("User's Travel History",
            style: TextStyle(
                fontSize: 20.0,
                fontFamily: 'montserrat',
                fontWeight: FontWeight.bold)),
        backgroundColor: Colors.deepPurple,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: userIds.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            iconColor: Colors.deepPurpleAccent,
            tileColor: Colors.transparent,
            leading: const Icon(LineAwesomeIcons.history),
            title: Text(userIds[index]),
            subtitle: Text(travelDocs[index]['StartLocation'] +
                ' - ' +
                travelDocs[index]['EndLocation'] +
                '\nPassenger Count:' +
                travelDocs[index]['Passenger_Count'] +
                '\n' +
                travelDocs[index]['Time']),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.deepPurpleAccent,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total Passenger Count: $totalPassengerCount',
                  style: const TextStyle(
                      fontSize: 20.0,
                      fontFamily: 'montserrat',
                      fontWeight: FontWeight.bold)),
              ElevatedButton(onPressed: () {}, child: const Text('SEND'))
            ],
          ),
        ),
      ),
    );
  }
}
