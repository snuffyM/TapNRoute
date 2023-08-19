import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:tapnroute/src/constants/sizes.dart';
import 'package:tapnroute/src/features/core/models/apply_model.dart';

import '../../../controllers/profile_controller.dart';

class travelScreen extends StatelessWidget {
  const travelScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () => Get.back(), icon: const Icon(LineAwesomeIcons.angle_left)),
        title: const Text("HISTORY", style: TextStyle(fontSize: 20.0, fontFamily: 'montserrat', fontWeight: FontWeight.bold)),
        backgroundColor: Colors.deepPurple,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDefaultSize),
          child: FutureBuilder<List<ApplyModel>>(
              future: controller.getTravelHistory(),
              builder: (context, snapshot) {
                print('FutureBuilder built');
                if(snapshot.connectionState == ConnectionState.done){
                  if(snapshot.hasData){
                    print("Snapshot Data");
                    print(snapshot.hasData);
                    print('ListView.builder created with ${snapshot.data!.length} items');
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (c, index){
                          return Column(
                            children: [
                              ListTile(
                                iconColor: Colors.deepPurpleAccent,
                                tileColor: Colors.transparent,
                                leading: const Icon(LineAwesomeIcons.history),
                                title: Text("Date : ${snapshot.data![index].date}"),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(snapshot.data![index].startLocation),
                                    Text(snapshot.data![index].endLocation),
                                    Text(snapshot.data![index].time),
                                    Text(snapshot.data![index].pCount),
                                  ],
                                ),
                              )
                            ],
                          );
                        }
                    );
                  }
                  else {
                    print('No data available');
                  }
                }
                else {
                  print('Connection state: ${snapshot.connectionState}');
                }
                return const SizedBox.shrink();
              }
          ),
        ),
      ),
    );
  }
}

