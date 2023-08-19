import 'package:cloud_firestore/cloud_firestore.dart';

class ApplyModel {
  final String? id;
  final String startLocation;
  final String endLocation;
  final String date;
  final String time;
  final String pCount;

  const ApplyModel({
    this.id,
    required this.startLocation,
    required this.endLocation,
    required this.date,
    required this.time,
    required this.pCount,
  });

  toJson() {
    return {
      "StartLocation": startLocation,
      "EndLocation": endLocation,
      "Date": date,
      "Time": time,
      "Passenger_Count": pCount,
    };
  }

  factory ApplyModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document){
    final data = document.data()!;
    return ApplyModel(
        id: document.id,
        startLocation: data["StartLocation"],
        endLocation: data["EndLocation"],
        date: data["Date"],
        time: data["Time"],
        pCount: data["Passenger_Count"]);
  }
}
